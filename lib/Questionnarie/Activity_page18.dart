
import 'package:consciousleap/Questionnarie/Activity_page19.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';

// I have not experienced many warm and trusting relationships with others Page


class Activity_page18 extends StatelessWidget{
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
                    child:Text("I have not experienced many warm and trusting relationships with others.",style:TextStyle(fontSize:16,fontFamily:'Comforta'),textAlign: TextAlign.center,)
                ),


              ),

              GradientBorderButton(btnName: "Strongly Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page19()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page19()
                      ));
                },),

              GradientBorderButton(btnName: "A Little Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page19()
                      ));
                },),
              GradientBorderButton(btnName: "Neither Agree Nor Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page19()
                      ));
                },),

              GradientBorderButton(btnName: "A Little Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page19()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page19()
                      ));
                },),

              GradientBorderButton(btnName: "Strongly Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page19()
                      ));
                },),
            ],
          )
        ],
      ),
    );
  }

}