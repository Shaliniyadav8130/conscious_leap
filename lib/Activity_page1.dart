import 'package:consciousleap/Activity_page2.dart';
import 'package:consciousleap/Activity_page23.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// I want to talk to a therapist
// or
// I am a Therapist Page

class Activity_page1 extends StatelessWidget{
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

              GradientBorderButton(btnName: "I want to talk to a Therapist",
              callBack: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>Activity_page2()
                    ));
              },),
              GradientBorderButton(btnName: "I am a Therapist",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page23()
                      ));
                },)
            ],
          )
        ],
      ),
    );
  }

}