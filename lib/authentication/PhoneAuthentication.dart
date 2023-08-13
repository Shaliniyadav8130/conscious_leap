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
      appBar: AppBar(
        //title: Text('Phone Number App'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 20, right: 20),
                child: IntlPhoneField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    counterText: '',
                    border: GradientOutlineInputBorder(
                      width: 2,
                      gradient: LinearGradient(
                        colors: [Color(0xff4961AC), Color(0xffF2685D), Color(
                            0xff4EC1BA)
                        ], // Replace with your desired gradient colors
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialCountryCode: 'India',
                  onChanged: (phone) {
                    setState(() {
                      Phone = phone.completeNumber;
                    });
                  },
                ),
              ),
              SizedBox(height: 22,),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        //width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff4961AC),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                          onPressed: () {
                            String completePhoneNumber = Phone;
                            SingnInWithOTP(completePhoneNumber);

                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyCode()
                                ));
                          },
                          child: Text('Send Code',
                            style: TextStyle(
                                fontFamily: 'Comforta', color: Colors.white),
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