import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:consciousleap/conscious_store/Conscious_Categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class consciousLogin extends StatefulWidget {
  @override
  State<consciousLogin> createState() => _consciousLoginState();
}

class _consciousLoginState extends State<consciousLogin> {
  final email = TextEditingController();
  final phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String Email = "";
  String Phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey, // Add this line if you intend to use form validation
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Center(
                  child:Text("Conscious Store Login",style:TextStyle(fontSize: 25,fontFamily: "Comforta",color: Color(0xff4961AC),fontWeight: FontWeight.bold)),
                ),

                SizedBox(
                  height:30,
                ),
                Row(
                  children: [
                    Expanded(
                      child:Padding(padding: EdgeInsets.only(left: 15,right:15),
                        child: TextFormField(
                          controller: email, // Assign the TextEditingController instance
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                              fontSize: 16.0,
                            ),
                            border: GradientOutlineInputBorder(
                                gradient: LinearGradient(
                                  colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                                ),
                                width: 2
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20),
                Row(
                  children: [
                    Expanded(
                      child:Padding(padding: EdgeInsets.only(left: 15,right:15),
                        child: TextFormField(
                          controller: email, // Assign the TextEditingController instance
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                              fontSize: 16.0,
                            ),
                            border: GradientOutlineInputBorder(
                                gradient: LinearGradient(
                                  colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)], // Replace with your desired gradient colors
                                ),

                                width:2
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),
                // Add more form fields as needed
                Center(
                  child: Container(
                    width: 161,
                    height: 41,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff4961AC),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 17, color: Colors.white, fontFamily: 'Comforta'),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>ConsciousCategories()
                            ));
                      },
                    ),
                  ),
                ),
              ],
            ),

          ),

      ),
    );
  }
}
