import 'package:consciousleap/user/components/FeelingWidget.dart';
import 'package:consciousleap/user/components/JournalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// User's Feeling check Widget

class FeelingCheck extends StatelessWidget {
  String name;

  FeelingCheck({
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
              Padding(padding: EdgeInsets.all(16),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  FeelingWidget(Feelingname: "Rain", icons: "assets/images/Asset 3@4x.png", color: Colors.white70, size: 12),
                  SizedBox(width: 3,),
                  FeelingWidget(Feelingname: "Sunshine", icons: "assets/images/Asset 5@4x.png", color: Colors.white70, size: 12),
                  SizedBox(width: 3,),
                  FeelingWidget(Feelingname: "Cloudy", icons: "assets/images/Asset 4@4x.png", color: Colors.white70, size: 12),
                  SizedBox(width: 3,),
                  FeelingWidget(Feelingname: "Lightening", icons: "assets/images/Asset 6@4x.png", color: Colors.white70, size: 12),
                  // ),


                ],
              ),
              )

              // Padding(
              //     padding: EdgeInsets.only(bottom: 10, left: 16, right: 16),
              //     child: GridView.count(
              //       shrinkWrap: true,
              //       crossAxisCount: 4,
              //       physics: NeverScrollableScrollPhysics(),
              //       //mainAxisSpacing: 15.0,
              //       crossAxisSpacing: 18.0,
              //       children: [
              //         FeelingWidget(
              //           icons: "assets/images/Asset 3@4x.png",
              //           Feelingname: "Rain",
              //           size: 10,
              //           color: Colors.grey,
              //         ),
                      // FeelingWidget(
                      //   icons: "assets/images/Asset 5@4x.png",
                      //   Feelingname: "Sunshine",
                      //   size: 10,
                      //   color: Colors.grey,
                      //   containerHeight: 200,
                      // ),
                      // FeelingWidget(
                      //   icons: "assets/images/Asset 4@4x.png",
                      //   Feelingname: "Cloudy",
                      //   size: 10,
                      //   color: Colors.grey,
                      //   containerHeight: 200,
                      // ),
                      // FeelingWidget(
                      //   icons: "assets/images/Asset 6@4x.png",
                      //   Feelingname: "Lightening",
                      //   size: 10,
                      //   color: Colors.grey,
                      //   containerHeight: 200,
                      // ),
                      // // Add more JournalWidget instances as needed
                    //],
                  //),

              //),
            ],
          ),

      ),
    );
  }
}
