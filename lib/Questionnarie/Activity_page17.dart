import 'package:consciousleap/widgets/Text_button.dart';
import 'package:consciousleap/Questionnarie/Activity_page18.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// My attitude towards myself could be more optimistic than most people's Page


class Activity_page17 extends StatelessWidget{
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
                    child:Text("My attitude towards myself could be more optimistic than most people's.",style:TextStyle(fontSize:16,fontFamily:'Comforta'),textAlign: TextAlign.center,)
                ),


              ),

              GradientBorderButton(btnName: "Strongly Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page18()
                      ));
                },),
              GradientBorderButton(btnName: "Somewhat Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page18()
                      ));
                },),

              GradientBorderButton(btnName: "A Little Agree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page18()
                      ));
                },),
              GradientBorderButton(btnName: "Neither Agree Nor Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page18()
                      ));
                },),

              GradientBorderButton(btnName: "A Little Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page18()
                      ));
                },),

              GradientBorderButton(btnName: "Somewhat Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page18()
                      ));
                },),

              GradientBorderButton(btnName: "Strongly Disagree",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page18()
                      ));
                },),
            ],
          )
        ],
      ),
    );
  }

}