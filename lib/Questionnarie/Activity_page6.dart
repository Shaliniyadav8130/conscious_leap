import 'package:consciousleap/Questionnarie/questionnarie.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// I am not sure what I am going through Page


class Activity_page6 extends StatelessWidget{
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
                    child:Center(
                    child:Text("I am not sure what I am going through",style:TextStyle(fontSize:16,fontFamily:'Comforta'),textAlign: TextAlign.center,)
                ),
                ),


              ),

              GradientBorderButton(btnName: "Talk to a Therapist",
                callBack: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) =>TherapistList()
                       ));
                },),
              GradientBorderButton(btnName: "I'm happy to take the Questionnaire",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>QuestionnaireScreen()
                      ));
                },),
            ],
          )
        ],
      ),
    );
  }

}