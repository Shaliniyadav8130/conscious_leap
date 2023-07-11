import 'package:consciousleap/Therapist_Dashboard/components/ReviewsWidget.dart';
import 'package:consciousleap/user/components/FeelingWidget.dart';
import 'package:consciousleap/user/components/JournalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MyReviews extends StatelessWidget {
  String name;

  MyReviews({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        width: 318,
        //height:100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Center(
              child:Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Comforta",
                    color: Color(0xff4961AC),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(16),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReviewsWidget(Feelingname: "Positive Vibes", icons: "assets/images/PositiveVibes.png", color: Colors.white70, size: 13),
                      SizedBox(height: 3,),
                      ReviewsWidget(Feelingname: "Calmness", icons: "assets/images/Calmness.png", color: Colors.white70, size: 13),
                      SizedBox(height: 3,),
                      ReviewsWidget(Feelingname: "Knowledge", icons: "assets/images/Knowledge.png", color: Colors.white70, size: 13),
                      //SizedBox(width: 3,),
                      //FeelingWidget(Feelingname: "Lightening", icons: "assets/images/Asset 6@4x.png", color: Colors.white70, size: 12),
                      // ),


                    ],
                  ),
                )


              ],
            ),

          ],
        ),

      ),
    );
  }
}
