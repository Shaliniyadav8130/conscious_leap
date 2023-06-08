import 'package:consciousleap/widgets/Text_button.dart';
import 'package:consciousleap/Questionnarie/Activity_page5.dart';
import 'package:flutter/material.dart';

// Select the Age group page


class Activity_page4 extends StatelessWidget{
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
                padding: EdgeInsets.only(bottom: 60.0),

                child:Text("Age Range",style:TextStyle(fontSize:20,fontFamily:'Comforta'),)
              ),

              GradientBorderButton(btnName: "12 To 18 Years",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page5()
                      ));
                },),
              GradientBorderButton(btnName: "19 To 24 Years",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page5()
                      ));
                },),

              GradientBorderButton(btnName: "25 or Above",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page5()
                      ));
                },),

            ],
          )
        ],
      ),
    );
  }

}