import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/Questionnarie/questionnarie.dart';

// Analysis Report of Questionnarie Page

class Analysis_Report extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom:15),
                child:Text("Initial Analysis",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),


              Padding(
                padding: EdgeInsets.only(bottom:20),
                  child: Container(
                    width: 370,
                    height: 110,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(65)),
                    child: Row(
                      children: [
                        Padding(padding:EdgeInsets.all(10),
                          child: SizedBox(
                            height:50,
                            width: 50,
                            child: Image.asset("assets/images/Therapy.png"),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff4961AC),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                        ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child:Padding(
                                padding: EdgeInsets.all(10),
                                 child:Text("Environmental Mastery",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                              ),

                            ),
                            Center(
                              child:SizedBox(
                                width: 180,
                                child:Text("You have a good sense of mastery & competence in managing the environment and you control",style: TextStyle(fontSize: 10),textAlign: TextAlign.center,),
                              ),

                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              Padding(
                padding: EdgeInsets.only(bottom:20),
                child: Container(
                  width: 370,
                  height: 110,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(65)),
                  child: Row(
                    children: [
                      Padding(padding:EdgeInsets.all(10),
                        child: SizedBox(
                          height:50,
                          width: 50,
                          child: Image.asset("assets/images/Therapy.png"),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff4961AC),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child:Padding(
                              padding: EdgeInsets.all(10),
                              child:Text("Environmental Mastery",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                            ),

                          ),
                          Center(
                            child:SizedBox(
                              width: 180,
                              child:Text("You have a good sense of mastery & competence in managing the environment and you control",style: TextStyle(fontSize: 10),textAlign: TextAlign.center,),
                            ),

                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom:20),
                child: Container(
                  width: 370,
                  height: 110,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(65)),
                  child: Row(
                    children: [
                      Padding(padding:EdgeInsets.all(10),
                        child: SizedBox(
                          height:50,
                          width: 50,
                          child: Image.asset("assets/images/Therapy.png"),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff4961AC),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child:Padding(
                              padding: EdgeInsets.all(10),
                              child:Text("Environmental Mastery",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                            ),

                          ),
                          Center(
                            child:SizedBox(
                              width: 180,
                              child:Text("You have a good sense of mastery & competence in managing the environment and you control",style: TextStyle(fontSize: 10),textAlign: TextAlign.center,),
                            ),

                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom:20),
                child: Container(
                  width: 370,
                  height: 110,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(65)),
                  child: Row(
                    children: [
                      Padding(padding:EdgeInsets.all(10),
                        child: SizedBox(
                          height:50,
                          width: 50,
                          child: Image.asset("assets/images/Therapy.png"),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff4961AC),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child:Padding(
                              padding: EdgeInsets.all(10),
                              child:Text("Environmental Mastery",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                            ),

                          ),
                          Center(
                            child:SizedBox(
                              width: 180,
                              child:Text("You have a good sense of mastery & competence in managing the environment and you control",style: TextStyle(fontSize: 10),textAlign: TextAlign.center,),
                            ),

                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }

}