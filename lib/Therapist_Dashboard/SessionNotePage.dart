import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/Therapist_Dashboard/SessionNotes.dart';
import 'package:consciousleap/controllers/signup_controllers.dart';
import 'package:consciousleap/user/UserProfile.dart';
import 'package:consciousleap/user/components/Blocks.dart';
import 'package:consciousleap/user/components/ConsciousStore.dart';
import 'package:consciousleap/user/components/FeelingCheck.dart';
import 'package:consciousleap/user/components/Heading.dart';
import 'package:consciousleap/user/components/JournalCorner.dart';
import 'package:consciousleap/user/components/Therapy.dart';
import 'package:consciousleap/user/components/calender.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:consciousleap/models/UserModel.dart';
import 'package:gradient_borders/gradient_borders.dart';

// Signup Page for a new User
class SessionNotePage extends StatefulWidget {
  final String userId; // Add a parameter to receive the user ID

  SessionNotePage({required this.userId}); // Constructor to receive the user ID


  @override
  State<SessionNotePage> createState() => _SessionNotePageState();
}

class _SessionNotePageState extends State<SessionNotePage> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _AgeController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _OccupationController = TextEditingController();
  final TextEditingController _SessionNumberController = TextEditingController();
  String? _selectedRelationshipStatus;
  final TextEditingController _complaintsController = TextEditingController();
  final TextEditingController _ThoughtController = TextEditingController();
  final TextEditingController _HomeworkController = TextEditingController();

  Future<void> storeSessionNotes() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection('session_notes').doc(widget.userId).collection('notes').add({
          'name': _NameController.text,
          'age': _AgeController.text,
          'gender': _genderController.text,
          'date': _dateController.text,
          'occupation': _OccupationController.text,
          'relationshipStatus': _selectedRelationshipStatus,
          'sessionNumber': _SessionNumberController.text,
          'complaints': _complaintsController.text,
          'thoughts': _ThoughtController.text,
          'homework': _HomeworkController.text,
          'timestamp': FieldValue.serverTimestamp(), // Optional: Store server timestamp
        });

        // Show a success message or navigate to a different screen
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Session notes saved successfully')));
       // Navigator.push(context,
        //            MaterialPageRoute(builder: (context) =>SessionNotes()
         //           ));
        // // Navigate to a different screen if needed
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SomeScreen()));
        Navigator.pop(context);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving session notes')));
        print('Error: $error');
      }
    }
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
                //SizedBox(height: 80,),
                Center(
                  child: Text("Therapy Session Notes", style: TextStyle(fontSize: 25, fontFamily: "Comforta", color: Color(0xff4961AC)),textAlign: TextAlign.center,),
                ),

                SizedBox(height: 25),
                Text("Client's Info", style: TextStyle(fontSize: 25, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 15),
                Text("Name ", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _NameController,
                  decoration: InputDecoration(
                    hintText: "Name",
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
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Text("Age ", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _AgeController,
                  decoration: InputDecoration(
                    hintText: "Age",
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
                      return 'Please enter Age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Date of Session ", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: "dd-mm-yy",
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
                      return 'Please enter Date ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Gender", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    hintText: "Gender",
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
                      return 'Please enter Gender ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Occupation", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _OccupationController,
                  decoration: InputDecoration(
                    hintText: "Type of Occupation",
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
                      return 'Please enter Occupation';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Relationship Status",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Comforta",
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedRelationshipStatus,
                  items: [
                    DropdownMenuItem(
                      value: 'Single',
                      child: Text('Single'),
                    ),
                    DropdownMenuItem(
                      value: 'Married',
                      child: Text('Married'),
                    ),
                    DropdownMenuItem(
                      value: 'Divorced',
                      child: Text('Divorced'),
                    ),
                    DropdownMenuItem(
                      value: 'Widow',
                      child: Text('Widow'),
                    ),
                  ],
                  decoration: InputDecoration(
                    hintText: "Select",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRelationshipStatus = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select relationship status';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Session Number", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _SessionNumberController,
                  decoration: InputDecoration(
                    hintText: "Type...",
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
                      return 'Please enter Session Number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                Text("Presenting Complaints", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _complaintsController,
                  maxLength: 500,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Main Thoughts & Notes", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ThoughtController,
                  maxLength: 500,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Homework given", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _HomeworkController,
                  maxLength: 500,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
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
                        "Submit",
                        style: TextStyle(fontSize: 17, color: Colors.white, fontFamily: 'Comforta'),
                      ),
                      onPressed: () async {
                        await storeSessionNotes();
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
