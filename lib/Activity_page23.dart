import 'package:consciousleap/therapist/login_therapist.dart';
import 'package:consciousleap/therapist/signup_therapist.dart';
import 'package:flutter/material.dart';
import 'package:consciousleap/widgets/Text_button.dart';

// Select you are new therapist or existing

class Activity_page23 extends StatelessWidget{
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
              GradientBorderButton(btnName: "Registered Therapist",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>login_therapist()
                      ));
                },),
              GradientBorderButton(btnName: "New Therapist",
                callBack: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) =>SignupTherapist()
                       ));
                },),

            ],
          )
        ],
      ),
    );
  }

}