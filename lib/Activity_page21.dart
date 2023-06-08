 import 'package:consciousleap/Activity_page22.dart';
import 'package:consciousleap/Infographic_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
 import 'package:consciousleap/widgets/Text_button.dart';


class Activity_page21 extends StatelessWidget{
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
              GradientBorderButton(btnName: "Member Dashboard",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Infographic_dahboard()
                      ));
                },),
              GradientBorderButton(btnName: "Book Another Session",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page22()
                      ));
                },),

            ],
          )
        ],
      ),
    );
  }

}