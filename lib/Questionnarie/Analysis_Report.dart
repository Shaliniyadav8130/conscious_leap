import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/Questionnarie/questionnarie.dart';
import 'package:velocity_x/velocity_x.dart';

// Analysis Report of Questionnarie Page

class Analysis_Report extends StatefulWidget {
  @override
  State<Analysis_Report> createState() => _Analysis_ReportState();
}

class _Analysis_ReportState extends State<Analysis_Report> {
  var db = FirebaseFirestore.instance;
  List<double> categoryPercentages = [0.0, 0.0, 0.0, 0.0];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    var reference = db.collection("userReport").doc(id);
    reference.get().then((query) {
      var data = query.data()!;
      var abc = data['report'];
      setState(() {
        for (int i = 0; i < 4; i++) {
          categoryPercentages[i] = abc[i];
        }
      });
      print(categoryPercentages);
    }, onError: (e) => print("Error completing: $e"));
  }
  void resetData() {
    setState(() {
      categoryPercentages = [0.0, 0.0, 0.0, 0.0];
    });
  }
  void navigateToQuestionnaire() {
    resetData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Activity_page4(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "Initial Analysis",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 24,
                  fontFamily: 'Comforta',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: List.generate(categoryPercentages.length, (index) {
                double percentage = categoryPercentages[index];
                String categoryText = '';
                String categoryImage;
                String categoryName = '';

                if (index == 0) {
                  categoryName = "Environmental Mastery";
                  categoryImage = 'assets/images/ic1.png';
                  // Environmental Mastery category
                  if (percentage <= 30) {
                    categoryText =
                    'You have difficulty managing everyday affairs; feel unable to change or improve surrounding contexts; are unaware of surrounding opportunities; and lack a sense of control over the external world.';
                  } else if (percentage >= 31 && percentage <= 50) {
                    categoryText =
                    'You are committed to improving your ability to manage everyday affairs and are open to exploring new opportunities that can positively impact your surroundings. You may have previously felt a lack.';
                  } else if (percentage >= 51 && percentage <= 70) {
                    categoryText =
                    'You have a good sense of mastery & competence in managing the environment;and you control complex external activities; and you make effective use of your surrounding opportunities very well.';
                  } else {
                    categoryText =
                    'You have a high sense of mastery & competence in managing the environment; and you control complex external activities; and you make effective use of your surrounding opportunitiesvery well.';
                  }
                } else if (index == 1) {
                  categoryName = "Purpose in Life";
                  categoryImage = 'assets/images/ic2.png';
                  // Purpose category
                  if (percentage <= 30) {
                    categoryText =
                    'You lack a sense of meaning in life; have few goals or aims, lack a sense of direction; do not see purpose of your past life; and you have no outlook or beliefs that give life meaning.';
                  } else if (percentage >= 31 && percentage <= 50) {
                    categoryText =
                    'You are in the process of discovering your sense of purpose and creating meaningful goals for yourself. While you may have felt directionless in the past, you are now exploring different outlooks.';
                  } else if (percentage >= 51 && percentage <= 70) {
                    categoryText =
                    'You depict good sense of directedness;and you  feel there is meaning to your present and past life;and you hold your beliefs that give life purpose; and you have aims and objectives for living.';
                  } else {
                    categoryText =
                    'You depict high sense of directedness; and you feel there is meaning to your present and past life; and you hold beliefs that give life purpose; and  you have aims and objectives for living.';
                  }
                } else if (index == 2) {
                  categoryName = "Self Acceptance";
                  categoryImage = 'assets/images/ic3.png';
                  // Self Acceptance Category
                  if (percentage <= 30) {
                    categoryText =
                    'You feel dissatisfied with yourself; are disappointed with what has occurred in your past life; are troubled about certain personal qualities; and wish to be different than what you are.';
                  } else if (percentage >= 31 && percentage <= 50) {
                    categoryText =
                    'You possess a low level of self-awareness and are actively working towards personal growth and development. While acknowledging your past experiences and  your personal own traits.';
                  } else if (percentage >= 51 && percentage <= 70) {
                    categoryText =
                    'You possess a positive attitude toward yourself;and you  acknowledge the facts and accept multiple aspects of yourself including both good and bad qualities; and feel positive about your past life.';
                  } else {
                    categoryText =
                    'You possess a highly positive attitude toward yourself; acknowledge and accept multiple aspects of yourself including both good and bad qualities; and feel positive about your past life.';
                  }
                } else if (index == 3) {
                  categoryName = "Relations with Others";
                  categoryImage = 'assets/images/ic4.png';
                  // Purpose category
                  if (percentage <= 30) {
                    categoryText =
                    'You have few close, trusting relationships with others; find it difficult to be warm, open, and you are concerned about others; and you are isolated and frustrated in interpersonal relationships.';
                  } else if (percentage >= 31 && percentage <= 50) {
                    categoryText =
                    'You cherish your close relationships and are working towards improving your ability to show warmth, openness, and concern towards others,feeling isolation and frustration in interpersonal relationships.';
                  } else if (percentage >= 31 && percentage <= 70) {
                    categoryText =
                    'You have warm, satisfying, trusting relationships with others; are concerned about the welfare of others; are capable of strong empathy, affection, and intimacy; and understand  relationships.';
                  } else {
                    categoryText =
                    'You have very warm, satisfying, trusting relationships with others; are concerned about the welfare of others; are capable of strong empathy, affection, and intimacy; and understand  human relationships.';
                  }
                } else {
                  // Default category
                  categoryImage = 'assets/images/Group 1.png';
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(),
                            child: Container(
                              margin: EdgeInsets.all(3),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xff4961AC),
                                          Color(0xffF2685D),
                                          Color(0xff4EC1BA)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(context.screenHeight*.1)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(6),
                                    child: SizedBox(
                                      height: 45,
                                      width: 45,
                                      child: Image.asset(categoryImage),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: context.screenWidth*.2,
                                    height: context.screenWidth*.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff4961AC),
                                        width: 2.0,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(context.screenWidth*.2),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 0),
                                      child: Text(
                                        //'${percentage.toStringAsFixed(2)}%',
                                        '${percentage.toInt()}%',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'Comforta',
                                            color: Color(0xff4961AC),
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Container(
                                    width: context.screenWidth*.53,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "${categoryName}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: 'Comforta',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              "${categoryText}",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Comforta'),

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 3,
                    ),
                  ],
                );
              },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child:Padding(
                    padding: EdgeInsets.only(left:60,right:60),
                    child:Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff4961AC),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextButton(
                        onPressed: navigateToQuestionnaire,
                        child: Text(
                          'Reset',
                          style:
                          TextStyle(fontFamily: 'Comforta', color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),

            SizedBox(height:20),
                      Row(
                        children: [
                          Expanded(
                            child:Padding(
                              padding: EdgeInsets.only(left:60,right:60),
                              child:Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: const GradientBoxBorder(
                                      gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>TherapistList()
                                        ));
                                  },
                                  child: Text(
                                    'Proceed to Therapy',
                                    style:
                                    TextStyle(fontFamily: 'Comforta', color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],

                      ),

            SizedBox(height:25),

            Row(
              children: [
                Expanded(child:
                Padding(padding: EdgeInsets.only(left:15,right:15),
                child:
                    SizedBox(
                      width:200,
                    child:Text.rich(
                        TextSpan(
                            text: 'Disclaimer: ',
                            style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "Comforta"),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'This questionnaire is intended to provide a general assessment of mental health and should not be considered a substitute for professional evaluation or advice. The results of this questionnaire are based solely on the provided responses and should be interpreted with caution. It is important to consult with a qualified mental health professional for assessment and personalized guidance.',
                                style: TextStyle(fontSize: 14,fontFamily: "Comforta",fontWeight: FontWeight.normal),
                              )
                            ]
                        )
                    ),
                )
                )
                ),
              ],
            ),

            SizedBox(height:20)

          ],
        ),
      ),
    );
  }
}
