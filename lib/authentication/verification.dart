import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Oneness.dart';
import 'package:consciousleap/Sign_up.dart';
import 'package:consciousleap/authentication/PhoneAuthentication.dart';
import 'package:consciousleap/login.dart';
import 'package:consciousleap/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var otp = '';

  Future<void> VerifyOTP(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: PhoneAuthentication.verify, // Replace with the correct verification ID
      smsCode: otp,
    );

    // Sign the user in (or link) with the credential
    try {
      await auth.signInWithCredential(credential);
      String phoneNumber = auth.currentUser?.phoneNumber ?? '';

      DocumentSnapshot therapistSnapshot =
      await FirebaseFirestore.instance.collection('TherapistData').doc(phoneNumber).get();

      if (therapistSnapshot.exists) {
        // Navigate to therapist dashboard
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen(phoneNumber)), // Replace with your therapist dashboard screen
        );
      } else {
        // Navigate to oneness screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Oneness()), // Replace with your oneness screen
        );
      }
    } catch (e) {
      // Handle authentication failure
      print("Authentication failed: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
            Positioned(
            top: 250, // Adjust this value to position the container as needed
            left: 0,
            right: 0,
            bottom:0,
                child: Container(
                decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                ),
                ),

            child:Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 25,
                  ),

                  Text(
                    "Phone Verification",
                    style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Comforta"),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Pinput(
                    length: 6,
                    // defaultPinTheme: defaultPinTheme,
                    // focusedPinTheme: focusedPinTheme,
                    // submittedPinTheme: submittedPinTheme,
                    onChanged: (value) {
                      otp = value;
                    },
                    showCursor: true,
                    onCompleted: (pin) => {print(pin)},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff4961AC),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          VerifyOTP(otp);
                        },
                        child: Text("Verify Phone Number", style: TextStyle(
                            fontFamily: "Comforta", color: Colors.white),)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Didn't receive code?",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Comforta"),
                      )),
                  TextButton(
                      onPressed: _codeSent ? null : resendCode,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            color: Color(0xff4961AC), fontFamily: "Comforta"),
                      ))
                ],
              ),
            ),
          ),
          ),
            ),

        ],
      ),

    );
  }


  bool _codeSent = false; // Keep track of whether the code has been sent

  // Function to resend the verification code
  void resendCode() {
    // Implement the logic to resend the verification code here
    // You can call SingnInWithOTP again or any other suitable method
    setState(() {
      _codeSent = true; // Set _codeSent to true to indicate that the code has been resent
    });
  }

}

// void VerifyOTP(String otp) async{
//   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneAuthentication.verify, smsCode: otp);
//
//   // Sign the user in (or link) with the credential
//   await auth.signInWithCredential(credential);
//   print(credential);
// }
// }