import 'package:consciousleap/Activity_page2.dart';
import 'package:consciousleap/Activity_page23.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// I want to talk to a therapist
// or
// I am a Therapist Page

class BusinessOptions extends StatelessWidget{
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
              Padding(
                padding: EdgeInsets.only(bottom:20),
                child: GradientBorderButton(btnName: "Member Dashboard",
                  callBack: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) =>Activity_page2()
                    //     ));
                  },),
              ),
              Padding(
                padding: EdgeInsets.only(bottom:20),
                child:GradientBorderButton(btnName: "Mindful Library Excercises",
                  callBack: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) =>Activity_page23()
                    //     ));
                  },)
              ),
              Padding(
                  padding: EdgeInsets.only(bottom:20),
                  child:GradientBorderButton(btnName: "Schedule a Session",
                    callBack: (){
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) =>TherapistList()
                           ));
                    },)
              ),

            ],
          )
        ],
      ),
    );
  }

}