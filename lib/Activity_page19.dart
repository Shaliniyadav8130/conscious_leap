import 'package:consciousleap/Activity_page20.dart';
import 'package:consciousleap/Activity_page6.dart';
import 'package:consciousleap/Activity_page9.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


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
                  child: Text("Strongly Agree",style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed:(){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page20()
                        ));
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
                  child:Text("Somewhat Agree" ,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page20()
                        ));
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
                  child:Text("A Little Agree" ,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page20()
                        ));
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
                  child:Text("Neither Agree Nor Disagree" ,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page20()
                        ));
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
                  child:Text("A Little Disagree" ,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page20()
                        ));
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
                  child:Text("Somewhat Disagree" ,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page20()
                        ));
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
                  child:Text("Strongly Disagree" ,style:TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page20()
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