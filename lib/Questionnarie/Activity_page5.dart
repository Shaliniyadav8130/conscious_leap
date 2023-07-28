import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:consciousleap/Questionnarie/Activity_page6.dart';
import 'package:consciousleap/Questionnarie/Activity_page7.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

//What are the significant concerns you are facing Page


class Activity_page5 extends StatelessWidget{
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
                      child:Text("What are the significant concerns you are facing ?",style:TextStyle(fontSize:16,fontFamily:'Comforta'),textAlign: TextAlign.center,)
                  ),


              ),

              GradientBorderButton(btnName: "I am having difficulty sleeping",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "I have been feeling constant sadness",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "I feel lost in my goals and career",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),
              GradientBorderButton(btnName: "I have feel anxious and overwhelmed",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),

              GradientBorderButton(btnName: "I feel no motivation to complete my tasks",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),

              GradientBorderButton(btnName: "I have been facing relationship issues",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>TherapistList()
                      ));
                },),

              GradientBorderButton(btnName: "I am not sure what I am going through",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page6()
                      ));
                },),

            ],
          )
        ],
      ),
    );
  }

}