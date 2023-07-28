import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/therapist/ScheduleSession.dart';
import 'package:consciousleap/widgets/CustomInputBorder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


// Page of Doctor Profile

class DoctorProfile extends StatefulWidget {
  final int id;
  const DoctorProfile({Key? key, required this.id}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection("Therapists").snapshots();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              var docs = snapshot.data!.docs;
              return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                     child: Image.network(
                  docs[widget.id]["images"],
                  ),
                  ),
                  scroll(docs, widget.id,context),
                ],
              );
            }),
      ),
    );
  }
}

scroll(var docs, var id,BuildContext context) {

  void _launchURL(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InAppWebViewPage(url: url),
      ),
    );
  }

  print(docs[id]["name"]);
  return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 7, top: 10),
                    child: Text(
                      docs[id]["name"],
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff4961AC),
                          fontFamily: 'Comforta'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text(
                      ""+docs[id]["qualification"][0]+", "+docs[id]["qualification"][1],
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: 'Comforta'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 100, right: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/images/Group 1.png"),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/images/Group 2.png"),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/images/Group 3.png"),
                        ),
                      ],
                    ),
                  ),
                ),

                GridView.extent(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,

                  children: [
                    Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color(0xff4961AC),
                                      Color(0xffF2685D),
                                      Color(0xff4EC1BA)
                                    ]),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [

                                  Container(
                                    padding:EdgeInsets.only(bottom: 5,top: 5),
                                    child: Text(
                                      "Experience",
                                      style: TextStyle(
                                          fontFamily: 'Comforta',
                                          fontSize: 12,
                                          color: Color(0xff4961AC)),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child:Container(
                                          width: 110,
                                          height: 2,
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(colors: [
                                                Color(0xff4961AC),
                                                Color(0xffF2685D),
                                                Color(0xff4EC1BA)
                                              ]),
                                              width: 2,
                                            ),
                                            //borderRadius: BorderRadius.circular(10)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Container(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Center(
                                            child: Text(
                                          ""+docs[id]["experience"],
                                          style: TextStyle(
                                              fontSize: 14, fontFamily: 'Comforta'),
                                          textAlign: TextAlign.center,
                                        )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                    Container(
                              width: 105,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color(0xff4961AC),
                                      Color(0xffF2685D),
                                      Color(0xff4EC1BA)
                                    ]),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 5,bottom: 5),
                                    child: Text(
                                      "Qualifications",
                                      style: TextStyle(fontFamily: 'Comforta', fontSize: 12, color: Color(0xff4961AC),),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child:
                                      Container(
                                        width: 110,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          border: const GradientBoxBorder(
                                            gradient: LinearGradient(colors: [
                                              Color(0xff4961AC),
                                              Color(0xffF2685D),
                                              Color(0xff4EC1BA)
                                            ]),
                                            width: 2,
                                          ),
                                          //borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),

                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 4,right: 4),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5,left:4),
                                          child:Text(
                                            "\u2022 "+docs[id]["qualification"][0],
                                            style: TextStyle(
                                                fontSize: 10, fontFamily: 'Comforta'),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(left:4),
                                        child:Text(
                                          "\u2022 "+docs[id]["qualification"][1],
                                          style: TextStyle(
                                              fontSize: 10, fontFamily: 'Comforta'),
                                        )

                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    Container(

                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color(0xff4961AC),
                                      Color(0xffF2685D),
                                      Color(0xff4EC1BA)
                                    ]),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(
                                        "Speaks",
                                        style: TextStyle(
                                            fontFamily: 'Comforta',
                                            fontSize: 12,
                                            color: Color(0xff4961AC)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child:
                                      Container(
                                        width: 110,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          border: const GradientBoxBorder(
                                            gradient: LinearGradient(colors: [
                                              Color(0xff4961AC),
                                              Color(0xffF2685D),
                                              Color(0xff4EC1BA)
                                            ]),
                                            width: 2,
                                          ),
                                          //borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: 5,left:4),
                                    child: Text(
                                      "\u2022 Hindi",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: 'Comforta'),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left:4),
                                  child:Text(
                                    "\u2022 English",
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: 'Comforta'),
                                  ),
                                  ),

                                  Expanded(
                                      child:SizedBox(
                                        width: 110,
                                        height: 100,
                                      ),

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),


                // Container(
                //   //width: MediaQuery.of(context).size.width,
                //   //color: Colors.deepOrangeAccent
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Container(
                //         width: 100,
                //         height: 100,
                //         decoration: BoxDecoration(
                //             border: const GradientBoxBorder(
                //               gradient: LinearGradient(colors: [
                //                 Color(0xff4961AC),
                //                 Color(0xffF2685D),
                //                 Color(0xff4EC1BA)
                //               ]),
                //               width: 2,
                //             ),
                //             borderRadius: BorderRadius.circular(10)),
                //         child: Column(
                //           children: [
                //
                //             Container(
                //               padding:EdgeInsets.only(bottom: 5,top: 5),
                //               child: Text(
                //                 "Experience",
                //                 style: TextStyle(
                //                     fontFamily: 'Comforta',
                //                     fontSize: 12,
                //                     color: Color(0xff4961AC)),
                //               ),
                //             ),
                //             Container(
                //               width: 110,
                //               height: 2,
                //               decoration: BoxDecoration(
                //                 border: const GradientBoxBorder(
                //                   gradient: LinearGradient(colors: [
                //                     Color(0xff4961AC),
                //                     Color(0xffF2685D),
                //                     Color(0xff4EC1BA)
                //                   ]),
                //                   width: 2,
                //                 ),
                //                 //borderRadius: BorderRadius.circular(10)
                //               ),
                //             ),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //
                //                 Container(
                //                   padding: EdgeInsets.only(top: 8),
                //                   child: Center(
                //                       child: Text(
                //                     ""+docs[id]["experience"],
                //                     style: TextStyle(
                //                         fontSize: 14, fontFamily: 'Comforta'),
                //                     textAlign: TextAlign.center,
                //                   )),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(width: 8),
                //       Container(
                //         width: 105,
                //         height: 100,
                //         decoration: BoxDecoration(
                //             border: const GradientBoxBorder(
                //               gradient: LinearGradient(colors: [
                //                 Color(0xff4961AC),
                //                 Color(0xffF2685D),
                //                 Color(0xff4EC1BA)
                //               ]),
                //               width: 2,
                //             ),
                //             borderRadius: BorderRadius.circular(10)),
                //         child: Column(
                //           children: [
                //             Container(
                //               padding: EdgeInsets.only(top: 5,bottom: 5),
                //               child: Text(
                //                 "Qualifications",
                //                 style: TextStyle(fontFamily: 'Comforta', fontSize: 12, color: Color(0xff4961AC),),
                //               ),
                //             ),
                //             Container(
                //               width: 110,
                //               height: 2,
                //               decoration: BoxDecoration(
                //                 border: const GradientBoxBorder(
                //                   gradient: LinearGradient(colors: [
                //                     Color(0xff4961AC),
                //                     Color(0xffF2685D),
                //                     Color(0xff4EC1BA)
                //                   ]),
                //                   width: 2,
                //                 ),
                //                 //borderRadius: BorderRadius.circular(10)
                //               ),
                //             ),
                //             Container(
                //               padding: EdgeInsets.only(left: 4,right: 4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Padding(
                //                     padding: EdgeInsets.only(top: 5),
                //                   ),
                //                   Text(
                //                     "\u2022 "+docs[id]["qualification"][0],
                //                     style: TextStyle(
                //                         fontSize: 10, fontFamily: 'Comforta'),
                //                   ),
                //                   Text(
                //                     "\u2022 "+docs[id]["qualification"][1],
                //                     style: TextStyle(
                //                         fontSize: 10, fontFamily: 'Comforta'),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         width: 8,
                //       ),
                //       Container(
                //
                //         width: 100,
                //         height: 100,
                //         decoration: BoxDecoration(
                //             border: const GradientBoxBorder(
                //               gradient: LinearGradient(colors: [
                //                 Color(0xff4961AC),
                //                 Color(0xffF2685D),
                //                 Color(0xff4EC1BA)
                //               ]),
                //               width: 2,
                //             ),
                //             borderRadius: BorderRadius.circular(10)),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Center(
                //               child: Container(
                //                 padding: EdgeInsets.only(top: 5,bottom: 5),
                //                 child: Text(
                //                   "Speaks",
                //                   style: TextStyle(
                //                       fontFamily: 'Comforta',
                //                       fontSize: 12,
                //                       color: Color(0xff4961AC)),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               width: 110,
                //               height: 2,
                //               decoration: BoxDecoration(
                //                 border: const GradientBoxBorder(
                //                   gradient: LinearGradient(colors: [
                //                     Color(0xff4961AC),
                //                     Color(0xffF2685D),
                //                     Color(0xff4EC1BA)
                //                   ]),
                //                   width: 2,
                //                 ),
                //                 //borderRadius: BorderRadius.circular(10)
                //               ),
                //             ),
                //             Padding(
                //               padding: EdgeInsets.only(top: 5),
                //             ),
                //             Text(
                //               "\u2022 Hindi",
                //               style: TextStyle(
                //                   fontSize: 12, fontFamily: 'Comforta'),
                //               textAlign: TextAlign.left,
                //             ),
                //             Text(
                //               "\u2022 English",
                //               style: TextStyle(
                //                   fontSize: 12, fontFamily: 'Comforta'),
                //             ),
                //             Expanded(
                //                 child:SizedBox(
                //                   width: 110,
                //                   height: 100,
                //                 ),
                //
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Expertise",
                        style: TextStyle(
                            fontFamily: 'Comforta',
                            fontSize: 14,
                            color: Color(0xff4961AC))),

                  ],
                ),
                SizedBox(height: 20,),
                GridView.builder(
                  padding: EdgeInsets.only(bottom: 0),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 50,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: docs[id]["expertise"].length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(colors: [
                                Color(0xff4961AC),
                                Color(0xffF2685D),
                                Color(0xff4EC1BA)
                              ]),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child:Padding(padding: EdgeInsets.only(left:3,right:3,top:3,bottom:3),
                        child:Center(
                          child: Text(
                            "" + docs[id]["expertise"][index],
                            style:
                            TextStyle(fontFamily: 'Comforta', fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        )

                      );
                    }),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "About the Therapist",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff4961AC),
                            fontFamily: 'Conforta'),
                      ),
                    ),
                  ],
                ),
                Text(
                  "" + docs[id]["about"],
                  style: TextStyle(fontFamily: 'Comforta'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: 340,
                    child: ElevatedButton(
                      onPressed: () {
                        String? scheduleSession = docs[id]["ScheduleSession"];
                        if (scheduleSession != null && scheduleSession.isNotEmpty) {
                          _launchURL(scheduleSession);
                        } else {
                          // Handle the case when the link is not available
                          // You can show a snackbar or dialog to inform the user
                        }
                      },
                      child: Text(
                        "Schedule Session",
                        style: TextStyle(
                            fontFamily: 'Comforta', color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff4961AC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
