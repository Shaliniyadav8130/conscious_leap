import 'package:consciousleap/Questionnarie/Analysis_Report.dart';
import 'package:consciousleap/Questionnarie/questionnarie.dart';
import 'package:consciousleap/models/UserModel.dart';
import 'package:consciousleap/user/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// User Sidebar Screen


class SidebarScreen extends StatelessWidget {
  //final UserModel user;
  //const SidebarScreen({Key? key}) : super(key: key);
  //const SidebarScreen({Key? key, required this.user}) : super(key: key);
  final User? user;
  final Map<String, dynamic> userData;

  SidebarScreen({Key? key, required this.user, required this.userData})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height:70
          ),
          Container(
            width:150,
            height:150,

            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(150)),

            child:CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/default.jpeg'),
            ),

          ),
          SizedBox(height:20),
          Padding(padding: EdgeInsets.only(left:20),
            child:Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name: ${userData['FirstName']}",
                style: TextStyle(fontSize: 13, fontFamily: "Comforta"),
              ),
            ),
          ),
          // SizedBox(
          //   height:10
          // ),Padding(padding: EdgeInsets.only(left:20),
          //   child:Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       "Age: 25",
          //       style: TextStyle(fontSize: 13, fontFamily: "Comforta"),
          //     ),
          //   ),
          // ),

          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left:20),
            child:Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email: ${userData['Email']}",
                style: TextStyle(fontSize: 13, fontFamily: "Comforta"),
              ),
            ),
          ),
          SizedBox(
            height:20
          ),
      Container(
        width:270,
        height:40,
        decoration: BoxDecoration(
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(25)),

        child:TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent), // Set overlay color to transparent to remove the ripple effect
          ),
          child: Text("Edit Profile",style: TextStyle(fontSize:15,color: Color(0xff4961AC),fontFamily:'Comforta'),),
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>EditProfile()
                ));
          },
        ),


      ),
          SizedBox(height:20),
          Container(
            width:270,
            height:40,
            decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(25)),

            child:TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent), // Set overlay color to transparent to remove the ripple effect
              ),
              child: Text("Questionnarie",style: TextStyle(fontSize:15,color: Color(0xff4961AC),fontFamily:'Comforta'),),
              onPressed: () async {
                bool hasGivenQuestionnaire = await checkQuestionnaireStatus();
                if (hasGivenQuestionnaire) {
                  // Navigate to Analysis Report
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Analysis_Report(),
                    ),
                  );
                } else {
                  // Navigate to Questionnaire
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionnaireScreen(),
                    ),
                  );
                }
              },            ),


          ),
        ],
      )
    );
  }


  Future<bool> checkQuestionnaireStatus() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection('userReport')
          .doc(userId)
          .get();
      return snapshot.exists;
    }
    return false;
  }
}