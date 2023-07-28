import 'package:consciousleap/therapist/ScheduleSession.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/therapist/doctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// List of the Therapist Page

class TherapistList extends StatefulWidget {

  const TherapistList({
    Key? key,
  }) : super(key:key);

  @override
  State<TherapistList> createState() => _TherapistListState();
}

class _TherapistListState extends State<TherapistList> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection("Therapists").snapshots();

  void _launchURL(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InAppWebViewPage(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              var docs = snapshot.data!.docs;
              print(docs[0]["expertise"].length);
              return ListView.builder(itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //width: double.infinity,
                  constraints: BoxConstraints(),
                  //color: Colors.deepOrange,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            //margin: EdgeInsets.only(top:10),
                            width: 150,
                            height: 150,
                            padding: EdgeInsets.all(2.0),
                            //height: 150,
                            decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff4961AC),
                                    Color(0xffF2685D),
                                    Color(0xff4EC1BA)
                                  ]),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(72)
                            ),
                            child:
                            CircleAvatar(
                              radius: 60,
                              // Adjust the radius to set the size of the avatar
                              //backgroundImage: AssetImage(
                              //'assets/images/doctor.jpg'),
                              backgroundImage: NetworkImage(
                                  docs[index]["images"]),
                              backgroundColor: Colors.transparent,
                              // Set the image for the avatar         // Alternatively, you can use `backgroundColor` and `child` properties to customize the appearance of the avatar
                            ),
                          ),


                          SizedBox(
                            width: 15,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(docs[index]["name"], style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Comforta',
                                      color: Color(0xff4961AC)),),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemCount: docs[index]["qualification"]
                                          .length,
                                      itemBuilder: (context, subIndexed) {
                                        return
                                          Container(
                                            child: Text("" +
                                                docs[index]["qualification"][subIndexed],
                                              style: TextStyle(fontSize: 13,
                                                  fontFamily: 'Comforta',
                                                  color: Colors.black),),
                                          );
                                      }
                                  ),


                                  Text("" + docs[index]["experience"] +
                                      " of experience", style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Comforta',
                                      color: Colors.black),),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3, bottom: 3),
                                    child: Text("Expertise", style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Comforta',
                                        color: Color(0xff4961AC)),),
                                  ),

                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemCount: docs[index]["expertise"]
                                          .length,
                                      itemBuilder: (context, subIndexd) {
                                        return
                                          Container(
                                            child: Text("\u2022 " +
                                                docs[index]["expertise"][subIndexd],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Comforta',
                                                  color: Colors.black),),
                                          );
                                      }
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Container(

                            width: 160,
                            height: 40,
                            //margin: EdgeInsets.only(bottom: 20.0),
                            decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff4961AC),
                                    Color(0xffF2685D),
                                    Color(0xff4EC1BA)
                                  ]),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12)),

                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors
                                    .transparent), // Set overlay color to transparent to remove the ripple effect
                              ),
                              child: Text("View Profile", style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: 'Comforta'),),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DoctorProfile(id: index),
                                    ));
                              },
                            ),


                          ),
                          SizedBox(width: 20,),
                          Container(
                            width: 160,
                            height: 40,
                            child: ElevatedButton(
                              child: Text("Schedule Session", style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: 'Comforta')),
                              onPressed: () {
                                String? ScheduleSession = docs[index]["ScheduleSession"];
                                if (ScheduleSession != null &&
                                    ScheduleSession.isNotEmpty) {
                                  _launchURL(ScheduleSession);
                                } else {
                                  // Handle the case when the link is not available
                                  // You can show a snackbar or dialog to inform the user
                                }
                              },


                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff4961AC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: 1.0,
                          width: 350,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff4961AC),
                                Color(0xffF2685D),
                                Color(0xff4EC1BA)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),),
                    ],

                  ),
                );
              },


                itemCount: docs.length,);
            }
        ),
      ),
    );
  }
}




