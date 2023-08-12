import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page2.dart';
import 'package:consciousleap/Activity_page23.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Chatbot/chatbot.dart';
import 'package:consciousleap/Chatbot/faq.dart';
import 'package:consciousleap/Oneness.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/Questionnarie/Activity_page6.dart';
import 'package:consciousleap/Questionnarie/Analysis_Report.dart';
import 'package:consciousleap/Questionnarie/questionnarie.dart';
import 'package:consciousleap/Sign_up.dart';
import 'package:consciousleap/Therapist_Dashboard/SessionNotePage.dart';
import 'package:consciousleap/Therapist_Dashboard/TherapistDashboard.dart';
import 'package:consciousleap/Therapist_Dashboard/TherapistProfile.dart';
import 'package:consciousleap/authentication/PhoneAuthentication.dart';
import 'package:consciousleap/authentication/verification.dart';
import 'package:consciousleap/conscious_Business/BusinessFrom.dart';
import 'package:consciousleap/conscious_Business/businessLogin.dart';
import 'package:consciousleap/conscious_store/Categories.dart';
import 'package:consciousleap/conscious_store/ConsciousAddress.dart';
import 'package:consciousleap/conscious_store/ConsciousStoreCart.dart';
import 'package:consciousleap/conscious_store/ConsciousStoreDeliveryType.dart';
import 'package:consciousleap/conscious_store/ConsciousStorePayment.dart';
import 'package:consciousleap/conscious_store/Conscious_Categories.dart';
import 'package:consciousleap/conscious_store/ProductDetails.dart';
import 'package:consciousleap/conscious_store/conscious_login.dart';
import 'package:consciousleap/login.dart';
import 'package:consciousleap/therapist/RequestCall.dart';
import 'package:consciousleap/therapist/Thankyou.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/therapist/UploadResume.dart';
import 'package:consciousleap/therapist/login_therapist.dart';
import 'package:consciousleap/therapist/signup_therapist.dart';
import 'package:consciousleap/user/EditProfile.dart';
import 'package:consciousleap/user/TherapistReview.dart';
import 'package:consciousleap/user/UserDashboard.dart';
import 'package:consciousleap/user/components/ScheduleSession.dart';
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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PhoneAuthentication(),
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
