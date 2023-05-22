import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/login.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class Activity_page2 extends StatelessWidget{
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
              Container(

                width:300,
                margin: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12)),

                child:TextButton(
                  child: Text("I am a New Member",style:TextStyle(color: Colors.black,fontFamily:'Comforta')),
                  onPressed:(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page3()
                        ));
                  },
                ),


              ),
              Container(
                width:300,
                margin: EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child:TextButton(
                  child:Text("I am an Existing Member" ,style:TextStyle(color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>login()
                        ));
                  },
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

}