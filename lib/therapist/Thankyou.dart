
import 'package:consciousleap/Sign_up.dart';
import 'package:consciousleap/login.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';

// Thankyou Screen

class Thankyou extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Column(
            children: [
              SizedBox(
                height:40
              ),
              Container(
                  width:200,
                  height:200,
                  child:Image.asset("assets/images/oneness_avatar.png")
              ),
              SizedBox(height: 35,),

              Text("Thank you!",style: TextStyle(fontSize: 25,fontFamily:"Comforta",fontWeight: FontWeight.bold,color: Color(0xff4961AC)),),
              SizedBox(height: 20,),
              Text("We've received your request and ",style: TextStyle(fontSize: 20,fontFamily:"Comforta",color: Color(0xff4961AC)),),
              Text("we'll get back to you shortly",style: TextStyle(fontSize: 20,fontFamily:"Comforta",color: Color(0xff4961AC)),),
            ],
          ),
        ],
      ),
    );
  }

}