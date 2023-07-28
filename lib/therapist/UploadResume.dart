import 'dart:io';

import 'package:consciousleap/therapist/Thankyou.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadResume extends StatefulWidget {
  const UploadResume({Key? key}) : super(key: key);

  @override
  State<UploadResume> createState() => _UploadResumeState();
}

class _UploadResumeState extends State<UploadResume> {
  File? resumeFile;
  String? resumeFileName; // Added variable to store the selected file name
  final TextEditingController _therapistNameController = TextEditingController();
  final TextEditingController _shortDescriptionController = TextEditingController();

  @override
  void dispose() {
    _therapistNameController.dispose();
    _shortDescriptionController.dispose();
    super.dispose();
  }

  Future<void> pickResumeFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        resumeFile = File(result.files.single.path!);
        resumeFileName = result.files.single.name; // Store the selected file name
      });
    }
  }

  Future<String?> uploadResume() async {
    if (resumeFile != null) {
      // Upload resume file to Firebase Storage
      String fileName = resumeFile!.path.split('/').last;
      Reference storageRef = FirebaseStorage.instance.ref().child('resumes').child(fileName);
      UploadTask uploadTask = storageRef.putFile(resumeFile!);

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Get authenticated user's UID
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User not authenticated')),
        );
        return null;
      }
      String userId = user.uid;

      // Store resume data in Firestore using userId
      CollectionReference resumeCollection = FirebaseFirestore.instance.collection('resumes');
      DocumentReference resumeDoc = resumeCollection.doc(userId);
      await resumeDoc.set({
        'userId': userId,
        'therapistName': _therapistNameController.text,
        'shortDescription': _shortDescriptionController.text,
        'resumeUrl': downloadUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resume uploaded successfully')),
      );
      return userId;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Basic Info", style: TextStyle(fontSize: 25, fontFamily: "Comforta", color: Color(0xff4961AC))),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 380,
                        height: 2,
                        color: Color(0xff4961AC),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text("Therapist Display Name *", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Color(0xff4961AC))),
                SizedBox(height: 10),
                TextFormField(
                  controller: _therapistNameController,
                  decoration: InputDecoration(
                    hintText: "Therapist Display Name",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                      //fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the therapist name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Short Description of Profile *", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Color(0xff4961AC))),
                SizedBox(height: 10),
                TextFormField(
                  controller: _shortDescriptionController,
                  maxLength: 500,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Short Description of profile",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a short description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Upload Resume *", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Color(0xff4961AC))),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5.0),
                        border: Border.all(
                          color:  Color(0xff4961AC),  // Specify the border color here
                          width: 1.0,        // Specify the border width here
                        ),
                      ),
                      child: TextButton(
                        onPressed: pickResumeFile,
                        child: resumeFileName != null
                            ? Column(
                          children: [
                            Icon(Icons.check, color: Color(0xff4961AC)),
                            SizedBox(height: 5),
                            Text(
                              resumeFileName!,
                              style: TextStyle(fontSize: 17, color: Color(0xff4961AC)),
                            ),
                          ],
                        )
                            : Text(
                          'Upload Resume +',
                          style: TextStyle(fontSize: 17, fontFamily: "Comforta",color: Color(0xff4961AC)),
                        ),
                      ),
                    ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Center(
                  child: Container(
                    width: 161,
                    height: 41,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff4961AC),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 17, color: Colors.white, fontFamily: 'Comforta'),
                      ),
                      onPressed: () async {
                        String? userId = await uploadResume();
                        if (userId != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Thankyou()),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
