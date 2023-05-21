import 'package:consciousleap/Activity_page1.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class Oneness extends StatelessWidget{
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
              Padding(padding: EdgeInsets.only(bottom: 20.0),
              child:Text("Hi,",style:TextStyle(fontFamily:'Comforta')),),
              Text("I am oneness",style:TextStyle(fontFamily:'Comforta')),
              Container(
                width:150,
                height:150,
                child:Image.asset('assets/images/oneness_avatar.png'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child:Container(
                  width:250,
                  child:Text("your ever-mindful companion in your well-being journey at consciousleap",textAlign: TextAlign.center,style:TextStyle(fontFamily:'Comforta')),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0),
                child:Text("How can I help you today?",style:TextStyle(fontFamily:'Comforta')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    width:120,
                    height:120,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),

                    child:InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>Activity_page1()
                            ));
                      },
                        child:Container(
                          child:Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                              SizedBox(
                               width:70,
                              height:70,
                          ),
                              Text("Therapy",style: TextStyle(fontSize: 14,fontFamily: "Comforta"),),
                        ],
                      ),
                    ),
                  ),
                  ),

                  SizedBox(
                    width:20,
                  ),
                  Container(

                    width:120,
                    height:120,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),

                    child:Container(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:70,
                            width:70
                          ),
                          Text("consciousleap for Business",style:TextStyle(fontFamily: "Comforta",fontSize: 13,),textAlign:TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Container(

                    width:120,
                    height:120,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),

                    child:Container(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width:70,
                            height:70,
                            child:Image.asset('assets/images/oneness_avatar.png'),
                          ),
                          Text("Conscious Store",style:TextStyle(fontFamily: "Comforta",fontSize:13 )),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width:20,
                  ),
                  Container(

                    width:120,
                    height:120,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),

                    child:Container(

                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height:70,
                            width:70,
                            child:Image.asset('assets/images/oneness_avatar.png')
                          ),
                          Text("oneness",style: TextStyle(fontSize: 14,fontFamily: "Comforta"),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),




            ],
          ),
        ],
      ),
    );
  }

}