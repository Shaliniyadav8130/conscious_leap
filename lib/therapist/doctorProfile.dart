
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/widgets/CustomInputBorder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_database/firebase_database.dart';

// Page of Doctor Profile

class DoctorProfile extends StatefulWidget {

  const DoctorProfile({
    Key? key,
  }) : super(key:key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       ),
         body: Stack(
           children: [
             SizedBox(
               width: double.infinity,
               child: Image.asset("assets/images/doctor.jpg"),
             ),
             scroll(),

           ],

         ),




    );
  }
}


scroll(){
  return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 1.0,
      minChildSize: 0.7,
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
                    child: Text("Sagrikaa Rastogi", style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff4961AC),
                        fontFamily: 'Comforta'), textAlign: TextAlign.center,),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Counselling Psychologist, M.A", style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Comforta'), textAlign: TextAlign.center,),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:20,
                          width: 20,
                          child:Image.asset("assets/images/Group 1.png"),
                        ),
                        SizedBox(
                          width:10,
                        ),
                        SizedBox(
                          height:20,
                          width: 20,
                          child:Image.asset("assets/images/Group 2.png"),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height:20,
                          width: 20,
                          child:Image.asset("assets/images/Group 3.png"),
                        ),


                      ],
                  ),
                ),
                ),
                Container(
                  //width: MediaQuery.of(context).size.width,
                  //color: Colors.deepOrangeAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Container(
                        width: 100,
                        height: 90,
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
                            Text("Experience", style: TextStyle(
                                fontFamily: 'Comforta',
                                fontSize: 12,
                                color: Color(0xff4961AC)),),

                            Container(
                              width: 100,
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
                            Center(
                                child: Text("3+ Years", style: TextStyle(
                                    fontSize: 14, fontFamily: 'Comforta'),
                                  textAlign: TextAlign.center,)
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10),

                      Container(
                        width: 100,
                        height: 90,
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
                            Text("Qualifications", style: TextStyle(
                                fontFamily: 'Comforta',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff4961AC)),),

                            Container(
                              width: 100,
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

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                ),
                                Text("\u2022M.A Counselling psychology",
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: 'Comforta'),),
                                Text("\u2022Member-APA", style: TextStyle(
                                    fontSize: 10, fontFamily: 'Comforta'),)
                              ],
                            ),


                          ],
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 90,
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
                              child: Text("Speaks", style: TextStyle(
                                  fontFamily: 'Comforta',
                                  fontSize: 12,
                                  color: Color(0xff4961AC)),
                                textAlign: TextAlign.center,),
                            ),


                            Container(
                              width: 100,
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
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            Text("\u2022 Hindi", style: TextStyle(
                                fontSize: 12, fontFamily: 'Comforta'),
                              textAlign: TextAlign.left,),
                            Text("\u2022 English", style: TextStyle(
                                fontSize: 12, fontFamily: 'Comforta'),)


                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text("Expertise", style: TextStyle(
                          fontFamily: 'Comforta', fontSize: 14, color: Color(
                          0xff4961AC)),),
                    ),
                  ],
                ),

                Container(
                  //width: 366,
                  //color: Colors.indigoAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
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
                        child: Center(
                          child: Text(
                            "Anxiety", style: TextStyle(fontFamily: 'Comforta'),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(width: 10,),

                      Container(
                        height: 50,
                        width: 100,
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
                        child: Center(
                          child: Text("Emotional Distress",
                            style: TextStyle(fontFamily: 'Comforta'),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 50,
                        width: 100,
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
                        child: Center(
                          child: Text(
                            "Trauma", style: TextStyle(fontFamily: 'Cpmforta'),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ],

                  ),

                ),

                SizedBox(height: 15,),

                Container(
                  //width: 366,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
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
                        child: Center(
                          child: Text("Productivity Concerns",
                            style: TextStyle(fontFamily: 'Conforta'),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 50,
                        width: 100,
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
                        child: Center(
                          child: Text("Relationship Issues",
                            style: TextStyle(fontFamily: 'Comforta'),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 50,
                        width: 100,
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
                        child: Center(
                          child: Text("Workplace Conflicts",
                            style: TextStyle(fontFamily: 'Comforta'),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ],
                  ),
                ),



                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("About the Therapist",
                        style: TextStyle(fontSize: 16,
                            color: Color(0xff4961AC),
                            fontFamily: 'Conforta'),
                      ),
                    ),
                  ],
                ),

                Text(
                  "A counselling Psychologist with experience in facilitating adolescents and young adults for self growth,anxiety,personality disorders, realtionship concerns in addition and other related concerns. My therapeutic approach is built around the premise of empathy and support. My aim is to understand you,your emotions and the cause of the chaos you feel you are in.",
                  style: TextStyle(fontFamily: 'Comforta'),),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: 340,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Schedule Session", style: TextStyle(
                          fontFamily: 'Comforta', color: Colors.white),),
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


