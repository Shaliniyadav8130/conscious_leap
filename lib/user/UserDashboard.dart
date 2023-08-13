
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/controllers/signup_controllers.dart';
import 'package:consciousleap/login.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/user/TherapistReview.dart';
import 'package:consciousleap/user/UserProfile.dart';
import 'package:consciousleap/user/components/Blocks.dart';
import 'package:consciousleap/user/components/ConsciousStore.dart';
import 'package:consciousleap/user/components/DailyAffirmation.dart';
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
import 'package:firebase_auth/firebase_auth.dart';

// Signup Page for a new User
class UserDashboard extends StatefulWidget {
  final User? user; // Pass the User object from Firebase authentication
  final Map<String, dynamic> userData; // Pass the user data fetched from Firestore

  UserDashboard({Key? key, required this.user, required this.userData})
      : super(key: key);


  // const UserDashboard({
  //   Key? key,
  // }) : super(key:key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  Map<String, dynamic> _signupData = {};

  @override
  void initState() {
    super.initState();
    _loadSignupData();
  }

  Future<void> _loadSignupData() async {
    try {
      if (widget.user?.uid != null) {
        Map<String, dynamic> signupData =
        await fetchSignupData(widget.user!.uid);

        setState(() {
          _signupData = signupData;
        });
      } else {
        print("User ID is null. Cannot fetch signup data.");
      }
    } catch (e) {
      print("Error fetching signup data: $e");
    }
  }

  Future<Map<String, dynamic>> fetchSignupData(String userId) async {
    DocumentSnapshot docSnapshot =
    await FirebaseFirestore.instance.collection('User').doc(userId).get();

    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: Color(0xffF0F0F0) ,
        title:  Text("Member",textAlign: TextAlign.center,style:TextStyle(fontSize:27,color: Color(0xff4961AC)),),
        centerTitle:true,
        //leading:Container(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    login()
                ));
            // Navigate back to previous screen
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon:  Container(
                  width:42,
                  height:50,

                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(55)),

                  child:CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/default.jpeg'),
                  ),



                )
            ),
          ),
        ],
      ),
      endDrawer: SidebarScreen(user: widget.user, userData: widget.userData),
      body: SingleChildScrollView(
        child:Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(child: Container()),
            //     Center(
            //       child: Text("Member",style:TextStyle(fontSize:27,color: Color(0xff4961AC)),),
            //     ),
            //     Expanded(child: Container()),
            //     Padding(
            //       padding: EdgeInsets.only(right: 10),
            //         child:Container(
            //           width:55,
            //           height:55,
            //           padding: EdgeInsets.all(2.0),
            //           decoration: BoxDecoration(
            //               border: const GradientBoxBorder(
            //                 gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
            //                 width: 2,
            //               ),
            //               borderRadius: BorderRadius.circular(55)),
            //
            //           child:CircleAvatar(
            //             radius: 50,
            //             backgroundImage: AssetImage('assets/images/doctor.jpg'),
            //           ),
            //
            //
            //
            //     ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Heading(name: "Hi, ${_signupData['FirstName'] ?? 'N/A'}  nice to see you again!"),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 10,right: 10,top:17),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Therapy(icon:"assets/images/Asset 1@4x 3.png",name: "Therapist Review",
                      callBack: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TherapistReview()
                            ));
                      }
                  ),
                  SizedBox(width: 5,),
                  Therapy(icon:"assets/images/Asset 1@4x 2.png",name: "Schedule a Session",

                  ),
                  SizedBox(width: 5,),
                  Therapy(icon:"assets/images/Asset 1@4x 1.png",name: "Find New Therapist",
              callBack: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TherapistList()
                    ));
              }
    ),
                ],
              ),
            ),
                const SizedBox(height:20),
            Container(
              width:390,
              height: 420,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(8.0),
                  color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child:  Container(
                    width: 330,
                    height: 380,
                    //color: Colors.deepOrangeAccent,
                    child:
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: CalendarScreen(),
                    ),
                  ),)


                ],
              ),

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
                 Expanded(child: DailyAffirmation(),)

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


