import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Activity_page4.dart';
import 'package:consciousleap/therapist/therapist_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Signup_therapist extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<Signup_therapist> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Additional logic after successful sign up
    } catch (e) {
      // Handle any errors
      print('Error: $e');
    }
  }

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
              Padding(
                padding: EdgeInsets.only(bottom: 55.0),
                child:Text("Therapist Sign-up" ,style: TextStyle(color: Colors.blueAccent, fontSize: 25,fontFamily:'Comforta'),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("First Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width:250,
                    height:50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Last Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width:250,
                    height:50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Email",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 44,
                  ),
                  Container(
                    width:250,
                    height:50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mobile",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width:250,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),



              Container(
                width:340,
                margin: EdgeInsets.only(top: 20.0),
                child:ElevatedButton(
                  child:Text("Sign-Up" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>therapist_call()
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

}
