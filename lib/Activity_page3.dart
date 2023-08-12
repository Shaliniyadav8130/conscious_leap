import 'package:consciousleap/Activity_page21.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';

// Select the option
// Recommended Questionnarie or
// Skip to Tele-Therapy

class Activity_page3 extends StatelessWidget{
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
                padding: EdgeInsets.only(bottom: 20.0),
                child:Text("Recommended",style: TextStyle(fontFamily:'Comforta'),),
              ),
              GradientBorderButton(btnName: "Questionnaire",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page4()
                      ));
                },),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 1.0,
                    width:130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 5.0,right: 5.0),
                    child:Text("or",style: TextStyle(fontFamily:'Comforta'),),
                  ),

                  Container(
                    height: 1.0,
                    width:130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0,top: 10.0),

                child:Text("Skip to Therapy",style: TextStyle(fontFamily:'Comforta'),),
              ),
              GradientBorderButton(btnName: "Connect with a Therapist",
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