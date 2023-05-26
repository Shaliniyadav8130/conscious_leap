import 'package:consciousleap/Activity_page1.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class QuestionAnswer {
  final String question;
  final String answer;

  QuestionAnswer({required this.question, required this.answer});
}


class faq extends StatelessWidget{

  final List<QuestionAnswer> faqData = [
    QuestionAnswer(
      question: 'What is mental health?',
      answer:
      'Mental health refers to a person\'s emotional, psychological, and social well-being. It affects how individuals think, feel, and act, and it also helps determine how individuals handle stress, relate to others, and make choices.',
    ),
    QuestionAnswer(
      question: 'What are some common mental health disorders?',
      answer:
      'Some common mental health disorders include anxiety disorders, depression, bipolar disorder, schizophrenia, post-traumatic stress disorder (PTSD), obsessive-compulsive disorder (OCD), and eating disorders.',
    ),
    QuestionAnswer(
      question: 'How can I improve my mental health?',
      answer:
      'Some ways to improve mental health include engaging in regular physical exercise, getting enough sleep, maintaining a balanced diet, practicing relaxation techniques like meditation or deep breathing, seeking social support, and engaging in activities that bring joy and fulfillment.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:Column(
        children: [
          Text("FAQ's"),
          Container(

            decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12)),
            child:ListView.builder(
              itemCount: faqData.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                    faqData[index].question,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        faqData[index].answer,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),

    );
  }

}