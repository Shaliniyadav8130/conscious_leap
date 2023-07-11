import 'package:consciousleap/Activity_page22.dart';
import 'package:consciousleap/Infographic_dashboard.dart';
import 'package:consciousleap/therapist/RequestCall.dart';
import 'package:consciousleap/therapist/UploadResume.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';



class therapist_call extends StatelessWidget{
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
              GradientBorderButton(btnName: "Upload Your Resume",
                callBack: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) =>UploadResume()
                       ));
                 },),
              GradientBorderButton(btnName: "Request a Call",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>RequestCall()
                      ));
                },),

            ],
          )
        ],
      ),
    );
  }

}