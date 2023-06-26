import 'package:consciousleap/Activity_page22.dart';
import 'package:consciousleap/Chatbot/faq.dart';
import 'package:consciousleap/Chatbot/oneness_screen.dart';
import 'package:consciousleap/Infographic_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';


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
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) =>Infographic_dahboard()
                //       ));
                 },),
              GradientBorderButton(btnName: "FAQ's",
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