import 'package:consciousleap/Chatbot/faq.dart';
import 'package:consciousleap/Chatbot/oneness_screen.dart';
import 'package:flutter/material.dart';
import 'package:consciousleap/widgets/Text_button.dart';

// Select FAQ or Chatbot


class Faq_or_chatbot extends StatelessWidget{
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              GradientBorderButton(btnName: "FAQ's",
                callBack: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>FAQPage()
                        ));
                 },),
              GradientBorderButton(btnName: "Oneness Chatbot",
                callBack: (){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) =>oneness_screen()
                         ));
                },),

            ],
          )
        ],
      ),
    );
  }

}