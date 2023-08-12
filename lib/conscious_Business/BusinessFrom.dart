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
class BusinessForm extends StatefulWidget {
  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80,),
                Center(
                  child: Text("Schedule a Call", style: TextStyle(fontSize: 25, fontFamily: "Comforta", color: Color(0xff4961AC)),textAlign: TextAlign.center,),
                ),

                SizedBox(height: 25),
                //Text("Client's Info", style: TextStyle(fontSize: 25, fontFamily: "Comforta", color: Colors.black)),
                //SizedBox(height: 15),
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
                Text("Phone no", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _AgeController,
                  decoration: InputDecoration(
                    hintText: "Phone No.",
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
                      return 'Please enter Phone No.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Company Name", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    hintText: "Company Name",
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
                      return 'Please enter Company Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("No. of Employees", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _OccupationController,
                  decoration: InputDecoration(
                    hintText: "No. of Employees",
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
                      return 'Please enter No. of employees';
                    }
                    return null;
                  },
                ),
                                SizedBox(height: 20),
                Text("Industry", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _SessionNumberController,
                  decoration: InputDecoration(
                    hintText: "Industry",
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
                      return 'Please enter Industry';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                Text("Country", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _SessionNumberController,
                  decoration: InputDecoration(
                    hintText: "Country",
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
                      return 'Please enter Country';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("How did you hear about us?", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ThoughtController,
                  maxLength: 200,
                  maxLines: 4,
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
                        //Navigator.push(context,
                          //  MaterialPageRoute(builder: (context) => SessionNotes()
                            //));
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
