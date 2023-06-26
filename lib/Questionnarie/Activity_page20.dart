import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:consciousleap/Analysis_Report.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// I often feel lonely because I have few close friends to share my concerns with Page


class Activity_page20 extends StatelessWidget{
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

            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 55.0),
                child:SizedBox(
                    width:300,
                    child:Text("I often feel lonely because I have few close friends to share my concerns with.",style:TextStyle(fontSize:16,fontFamily:'Comforta'),textAlign: TextAlign.center,)
                ),


              ),

              GradientBorderButton(btnName: "Strongly Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "A Little Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "Neither Agree nor Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "A Little Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "Strongly Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
            ],
          )
        ],
      ),
    );
  }

}