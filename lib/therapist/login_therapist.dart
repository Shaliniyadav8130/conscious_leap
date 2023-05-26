import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class login_therapist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 55.0),
                child:Text("Therapist Login" ,style: TextStyle(color: Colors.blueAccent, fontSize: 25,fontFamily:'Comforta'),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Email",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 44,
                  ),
                  Container(
                    width:250,
                    height:50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mobile",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width:250,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),



              Container(
                width:340,
                margin: EdgeInsets.only(top: 20.0),
                child:ElevatedButton(
                  child:Text("Login" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>Activity_page21()
                        ));
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
