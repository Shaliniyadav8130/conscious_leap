import 'package:consciousleap/Activity_page7.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


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
                    child:Text("I am not sure what I am going through",style:TextStyle(fontSize:16,fontFamily:'Comforta'),textAlign: TextAlign.center,)
                ),


              ),

              Container(

                width:320,
                margin: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12)),

                child:TextButton(
                  child: Text("Talk to a Tele-Therapist",style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed:(){

                  },
                ),


              ),
              Container(
                width:320,
                margin: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child:TextButton(
                  child:Text("I'm happy to take the Questionnarie" ,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page7()
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