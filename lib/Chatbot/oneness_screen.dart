import 'package:consciousleap/Activity_page1.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class oneness_screen extends StatelessWidget{
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
                padding: EdgeInsets.only(top: 50.0,bottom: 50),
              child:Container(
                width:150,
                height:150,
                child:Image.asset('assets/images/oneness_avatar.png'),
              ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child:Container(
                  width:250,
                  child:Text("oneness Chatbot",textAlign: TextAlign.center,style:TextStyle(fontFamily:'Comforta')),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30.0),
                child:Text("online",style:TextStyle(fontFamily:'Comforta',color: Colors.grey)),
              ),
              Container(
                width:320,
                margin: EdgeInsets.only(top: 20.0),
                child:ElevatedButton(
                  child:Text("Start Chat" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}