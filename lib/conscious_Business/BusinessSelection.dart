import 'package:consciousleap/Activity_page2.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:consciousleap/Activity_page23.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/conscious_Business/BusinessSignup.dart';
import 'package:consciousleap/conscious_Business/businessLogin.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Select the option
// Recommended Questionnarie or
// Skip to Tele-Therapy

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

              GradientBorderButton(btnName: "Schedule a Call",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>BusinessSignup()
                      ));
                },),

              SizedBox(height:5),
              GradientBorderButton(btnName: "Existing Member",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>businessLogin()
                      ));
                },),

            ],
          )
        ],
      ),
    );
  }

}
