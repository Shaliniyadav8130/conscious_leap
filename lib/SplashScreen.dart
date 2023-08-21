import 'package:consciousleap/SplashScreen2.dart';
import 'package:flutter/material.dart';
import 'dart:async';

//consciouleap logo splash


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen2(),
      ));
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:300,
                height: 200,
                decoration: BoxDecoration(
                  //color: Colors.white, // Set background color if needed
                ),
                // Adjust the BoxFit property as needed to scale the GIF
                child:Center(
                  child: Image.asset('assets/images/logo12.png',),
                ),
              ),
            ],
          ),

        ],
      ),

    );
  }
}
