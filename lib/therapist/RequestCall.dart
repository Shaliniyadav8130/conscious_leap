import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/therapist/Thankyou.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RequestCall extends StatefulWidget {
  const RequestCall({
    Key? key,
  }) : super(key: key);

  @override
  State<RequestCall> createState() => _RequestCallState();
}

class _RequestCallState extends State<RequestCall> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> saveRequestCallData() async {
    String subject = subjectController.text;
    String description = descriptionController.text;

    if (subject.isEmpty) {
      // Show an error message for the subject field
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter the subject'),
        ),
      );
      return;
    }

    if (description.isEmpty) {
      // Show an error message for the description field
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter the description'),
        ),
      );
      return;
    }

    try {
      String id = FirebaseAuth.instance.currentUser!.uid;

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference requestCallCollection = firestore.collection('Request_calls');

      DocumentReference requestCallDocRef = requestCallCollection.doc(id);

      await requestCallDocRef.set({
        'subject': subject,
        'description': description,
      });

      print('Request call data stored successfully.');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Thankyou()),
      );

      // Show a success message or navigate to another screen
    } catch (e) {
      print('Error storing request call data: $e');
      // Show an error message or handle the error appropriately
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
                Text(
                  "Request a Call",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Comforta",
                      color: Color(0xff4961AC)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 380,
                        height: 2,
                        color: Color(0xff4961AC),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Subject *",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Comforta",
                      color: Color(0xff4961AC)),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    hintText: "Subject",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the subject';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Short Description of your query*",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Comforta",
                      color: Color(0xff4961AC)),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  maxLength: 500,
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText: "Short Description of your query",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the description';
                    }
                    return null;
                  },
                ),
                Center(
                  child: Container(
                    width: 161,
                    height: 41,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                        color: Color(0xff4961AC),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                        MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        "Request Call",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: 'Comforta'),
                      ),
                      onPressed: () {
                        saveRequestCallData();
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
