
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
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
class UserDashboard extends StatefulWidget {

  // const UserDashboard({
  //   Key? key,
  // }) : super(key:key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child:Column(
          children: [
            Padding(padding: EdgeInsets.only(top:50),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container()),
                Center(
                  child: Text("Member",style:TextStyle(fontSize:27,color: Color(0xff4961AC)),),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                    child:Container(
                      width:55,
                      height:55,
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(55)),

                      child:CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/doctor.jpg'),
                      ),



                ),
                ),
              ],
            ),
            ),
            Row(
              children: [
                Heading(name: "Hi, Member, nice to see you again!"),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 10,right: 10,top:17),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Therapy(icon:"assets/images/Asset 1@4x 3.png",name: "Therapist Review"),
                  SizedBox(width: 5,),
                  Therapy(icon:"assets/images/Asset 1@4x 2.png",name: "Schedule a Session"),
                  SizedBox(width: 5,),
                  Therapy(icon:"assets/images/Asset 1@4x 1.png",name: "Schedule a Session"),
                ],
              ),
            ),
                const SizedBox(height:20),
            Row(
              children: [
                Expanded(
                    child: Container(
                      width: 330,
                      height: 380,
                      //color: Colors.deepOrangeAccent,
                      child:
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: CalendarScreen(),
                      ),
                    ),
                  ),
              ],
            ),


            // Padding(
            //   padding: EdgeInsets.only(left:10,right:10),
            //   child: GridView.count(
            //     shrinkWrap: true,
            //     crossAxisCount: 3,
            //     physics: NeverScrollableScrollPhysics(),
            //     mainAxisSpacing: 8.0,
            //     crossAxisSpacing: 8.0,
            //     children: [
            //       Therapy(icon:"assets/images/Asset 1@4x 3.png",name: "Therapist Review"),
            //       Therapy(icon:"assets/images/Asset 1@4x 2.png",name: "Schedule a Session"),
            //       Therapy(icon:"assets/images/Asset 1@4x 1.png",name: "Schedule a Session"),
            //       // Add more Therapy widgets as needed
            //     ],
            //   ),
            //
            // ),
            // Row(
            //   children: [
            //        CalendarScreen()
            //   ],
            // ),


             Row(
               children: [
                 JournalCorner(name:"My Journal Corner")
               ],
             ),


             Row(
               children: [
                  Expanded(child: FeelingCheck(name:"Feeling Check"),)
               ],
             ),

            Padding(padding: EdgeInsets.only(top:20,left:10,right:10),
            child:Row(
              children: [
                Blocks(),
                SizedBox(width:10),
                ConsciousStore()
              ],
            )),
             SizedBox(
               height:20,
             ),

          ],
        ),
      )

    );
  }
}


