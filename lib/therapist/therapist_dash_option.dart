import 'package:consciousleap/Activity_page21.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Sign_up.dart';
import 'package:consciousleap/login.dart';
import 'package:consciousleap/therapist/Infographic_therapist.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';


class therapist_dash_option extends StatelessWidget{
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
              GradientBorderButton(btnName: "Therapist Dashboard",
                callBack: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) =>Infographic_therapist()
                       ));
                },),

            ],
          )
        ],
      ),
    );
  }

}