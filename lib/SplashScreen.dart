import 'package:consciousleap/Oneness.dart';
import 'package:consciousleap/Therapist_Dashboard/TherapistDashboard.dart';
import 'package:consciousleap/therapist/RequestCall.dart';
import 'package:consciousleap/therapist/Thankyou.dart';
import 'package:consciousleap/therapist/UploadResume.dart';
import 'package:consciousleap/therapist/signup_therapist.dart';
import 'package:consciousleap/user/UserDashboard.dart';
import 'package:consciousleap/user/components/calender.dart';
import 'package:consciousleap/userprofile.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserDashboard(),
      ));
    });
    // Add any initialization logic here if needed
    // For example, you can navigate to the main screen after a certain duration using a Timer.

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set background color if needed
          ),
          // Adjust the BoxFit property as needed to scale the GIF
          child:Center(
            child: Image.asset('assets/images/final_last2.gif', fit: BoxFit.cover),
          ),
      ),
    );
  }
}
