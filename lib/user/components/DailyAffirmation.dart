import 'package:consciousleap/user/components/FeelingWidget.dart';
import 'package:consciousleap/user/components/JournalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DailyAffirmation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        width: 318,
       // height:100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(padding:EdgeInsets.all(10),
        child:Container(
          width: 308,
          //height:90,
          decoration: BoxDecoration(
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Center(
                child:Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text("Daily Affirmation",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Comforta",
                      color: Color(0xff4961AC),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height:10,),
              Padding(padding: EdgeInsets.only(left:10,right: 10,),
                child: Text("I am in the right place at the right time, doing the right thing" ,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "Comforta",
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height:15),
              Center(
                child: Text("-Louis Hay" ,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "Comforta",
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height:15)

            ],
          ),

        ),
        ),

      ),
    );
  }
}
