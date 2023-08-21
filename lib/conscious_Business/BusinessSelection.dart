import 'package:consciousleap/conscious_Business/BusinessFrom.dart';
import 'package:consciousleap/conscious_Business/businessLogin.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Sehedule Call or Login

class BusinessSelection extends StatelessWidget{
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

              GradientBorderButton(btnName: "Schedule a Call",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>BusinessForm()
                      ));
                },),

              SizedBox(height:5),
              GradientBorderButton(btnName: "Existing Member",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>businessLogin()
                      ));
                },),

            ],
          )
        ],
      ),
    );
  }

}
