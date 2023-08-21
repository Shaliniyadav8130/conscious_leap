import 'package:consciousleap/authentication/PhoneAuthentication.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// Gif splash


class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PhoneAuthentication(),
      ));
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/images/final_last2.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),);
  }
}
