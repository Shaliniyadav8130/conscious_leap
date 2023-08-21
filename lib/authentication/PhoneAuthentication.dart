import 'package:consciousleap/authentication/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:gradient_borders/gradient_borders.dart';

class PhoneAuthentication extends StatefulWidget {
  static String verify='';
  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  final email = TextEditingController();
  final phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String Email = "";
  String Phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text('Phone Number App'),
      //),
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
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Welcom to Consciousleap",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter Your Mobile Number",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ],
                      ),


                      SizedBox(height:40),
                      IntlPhoneField(
                        controller: phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          counterText: '',
                          border: GradientOutlineInputBorder(
                            width: 2,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff4961AC),
                                Color(0xffF2685D),
                                Color(0xff4EC1BA),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        ),
                        initialCountryCode: 'India',
                        onChanged: (phone) {
                          setState(() {
                            Phone = phone.completeNumber;
                          });
                        },
                      ),
                      SizedBox(height: 22),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff4961AC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  String completePhoneNumber = Phone;
                                  SingnInWithOTP(completePhoneNumber);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifyCode(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Get OTP',
                                  style: TextStyle(
                                    fontFamily: 'Comforta',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void SingnInWithOTP(String completePhoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: completePhoneNumber,
        // Use the complete international phone number
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          PhoneAuthentication.verify = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Wrong Otp")));
    }
  }
}