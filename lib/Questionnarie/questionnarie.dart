import 'package:consciousleap/therapist/doctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:consciousleap/Questionnarie/Analysis_Report.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:math';

void main() {
  runApp(QuestionnaireApp());
}

class QuestionnaireApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionnaire App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuestionnaireScreen(),
    );
  }
}

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  bool isOptionSelected = false;

  int currentCategoryIndex = 0;
  int currentQuestionIndex = 0;
  int currentRatingIndex=0;
  int totalCategories = 4;
  List<int> totalQuestionsPerCategory = [4, 3,3,3];
  List<List<int>> categoryRatings = [[0, 0, 0, 0], [0, 0, 0],[0, 0, 0],[0, 0, 0]];
  List<List<String>> categories = [
    [
      'Environment',
      'The demands of everyday life often get me down',
      'I do not fit very well with the people and the community around me',
      'I am quite good at managing the many responsibilities of my life',
      'I often feel overwhelmed by my responsibilities'
    ],
    [
      'Purpose',
      'I have a sense of direction and purpose in life',
      "I don't have a good sense of what it is I'm trying to accomplish in life",
      'My daily activities often seem trivial and unimportant to me',
    ],
    [
      'Self Acceptance',
      'In general I feel confident and positive about myself',
      "I like most parts of my personality",
      'My attitude about myself is probably not as positive as most people feel about themselves',
    ],
    [
      'Positive relations with others',
      'I have not experienced many warms and trusting relationships with others',
      "Maintaining close relationships has been difficult anf frustrating for me.",
      'I often feel lonely because I have few close friends with whom to share my concerns',
    ],
  ];
  List<List<Map<String, dynamic>>> ratings = [
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 7},
      {'option': 'Somewhat Agree', 'rating': 6},
      {'option': 'A Little Agree', 'rating': 5},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 3},
      {'option': 'Somewhat Disagree', 'rating': 2},
      {'option': 'Strongly Disagree', 'rating': 1},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 7},
      {'option': 'Somewhat Agree', 'rating': 6},
      {'option': 'A Little Agree', 'rating': 5},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 3},
      {'option': 'Somewhat Disagree', 'rating': 2},
      {'option': 'Strongly Disagree', 'rating': 1},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 7},
      {'option': 'Somewhat Agree', 'rating': 6},
      {'option': 'A Little Agree', 'rating': 5},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 3},
      {'option': 'Somewhat Disagree', 'rating': 2},
      {'option': 'Strongly Disagree', 'rating': 1},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 7},
      {'option': 'Somewhat Agree', 'rating': 6},
      {'option': 'A Little Agree', 'rating': 5},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 3},
      {'option': 'Somewhat Disagree', 'rating': 2},
      {'option': 'Strongly Disagree', 'rating': 1},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],[
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
    [
      {'option': 'Strongly Agree', 'rating': 1},
      {'option': 'Somewhat Agree', 'rating': 2},
      {'option': 'A Little Agree', 'rating': 3},
      {'option': 'Neither Agree nor Disagree', 'rating': 4},
      {'option': 'A Little Disagree', 'rating': 5},
      {'option': 'Somewhat Disagree', 'rating': 6},
      {'option': 'Strongly Disagree', 'rating': 7},
    ],
  ];
  void navigateToResultScreen(BuildContext context, List<double> categoryPercentages) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Analysis_Report(categoryPercentages),
      ),
    );
  }

  void updateRating(int rating) {
    setState(() {
      categoryRatings[currentCategoryIndex][currentQuestionIndex] = rating;
      isOptionSelected = true;
    });
  }


  void calculateCategoryPercentagesAndNavigate() {
    List<double> categoryPercentages = [];

    for (int i = 0; i < totalCategories; i++) {
      int categoryRatingSum = categoryRatings[i].reduce((value, element) => value + element);
      double categoryPercentage = (categoryRatingSum / (totalQuestionsPerCategory[i] * 7)) * 100;
      categoryPercentages.add(categoryPercentage);
    }

    navigateToResultScreen(context, categoryPercentages);
  }

  Widget buildQuestion() {
    int currentQuestionNumber = currentQuestionIndex + 1;
    int totalQuestions = totalQuestionsPerCategory[currentCategoryIndex];
    String category = categories[currentCategoryIndex][0];
    String question = categories[currentCategoryIndex][currentQuestionIndex + 1];
    List<Map<String, dynamic>> options = ratings[currentRatingIndex].toList();
    // print(ratings[currentRatingIndex]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire '),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(

                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: TextStyle(fontSize: 16,fontFamily: 'Comforta'),textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: options.map((option) {
                  return Container(
                    width: 300,
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [Color(0xff4961AC), Color(0xffF2685D), Color(0xff4EC1BA)],
                        ),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        '${option['option']}',
                        style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Comforta'),
                      ),
                      onPressed: () {
                        updateRating(option['rating']);
                        print(option['rating']);
                      },
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding:EdgeInsets.only(top:35),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2), // Set the border radius here
                  ),

                  child:TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          // if (states.contains(MaterialState.pressed)) {
                          //   return Colors.red; // Background color when the button is pressed
                          // }
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.grey; // Background color when the button is disabled
                          }
                          return Color(0xff4961AC); // Default background color
                        },
                      ),
                    ),
                    onPressed: isOptionSelected
                        ? () {
                      if (currentQuestionIndex < totalQuestionsPerCategory[currentCategoryIndex] - 1) {
                        setState(() {
                          currentQuestionIndex++;
                          isOptionSelected = false; // Reset the option selection for the next question
                        });
                      } else {
                        if (currentCategoryIndex < totalCategories - 1) {
                          setState(() {
                            currentCategoryIndex++;
                            currentQuestionIndex = 0;
                            currentRatingIndex++;
                            isOptionSelected = false; // Reset the option selection for the next question
                          });
                        } else {
                          calculateCategoryPercentagesAndNavigate();
                        }
                      }
                    }
                        : null, // Disable the button when no option is selected
                    child: Text('Next', style: TextStyle(fontFamily: 'Comforta', color: Colors.white)),
                  ),
                ),

              ),



            ],
          ),
        ),
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return buildQuestion();
  }
}