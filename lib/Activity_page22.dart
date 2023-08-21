import 'package:flutter/material.dart';
import 'package:consciousleap/widgets/Text_button.dart';


class Activity_page22 extends StatelessWidget{
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
              GradientBorderButton(btnName: "Continue with Existing Therapist",
                callBack: (){
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) =>Infographic_dahboard()
                //       ));
                 },),
              GradientBorderButton(btnName: "Find me Another Therapist",
                callBack: (){
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>login()
                  //     ));
                },),

            ],
          )
        ],
      ),
    );
  }

}