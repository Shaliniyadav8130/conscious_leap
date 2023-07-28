
import 'package:consciousleap/Sign_up.dart';
import 'package:consciousleap/login.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/widgets/Text_button.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Select the option
// I am a new member or
// I am an existing member


class Activity_page2 extends StatelessWidget{
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
              GradientBorderButton(btnName: "I am a New Member",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>SignupView()
                      ));
                },),
              GradientBorderButton(btnName: "I am an Existing Member",
                callBack: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>login()
                      ));

                },),

            ],
          )
        ],
      ),
    );
  }

}

