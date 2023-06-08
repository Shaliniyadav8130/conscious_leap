import 'package:consciousleap/widgets/Text_button.dart';
import 'package:consciousleap/Questionnarie/Activity_page20.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// Maintaining close relationships has been challenging and frustrating for me Page


class Activity_page19 extends StatelessWidget{
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
                    child:Text("Maintaining close relationships has been challenging and frustrating for me.",style:TextStyle(fontSize:16,fontFamily:'Comforta'),textAlign: TextAlign.center,)
                ),


              ),

              GradientBorderButton(btnName: "Strongly Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page20()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page20()
                      ));
                },),
              GradientBorderButton(btnName: "A Little Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page20()
                      ));
                },),
              GradientBorderButton(btnName: "Neither Agree Nor Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page20()
                      ));
                },),

              GradientBorderButton(btnName: "A Little Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page20()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page20()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page20()
                      ));
                },),
            ],
          )
        ],
      ),
    );
  }

}