import 'package:consciousleap/authentication/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:gradient_borders/gradient_borders.dart';

//After mobile otp screen for user

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Phone Number App'),
      //),
      body:
      Stack(
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
            top: 250,
            // Adjust this value to position the container as needed
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Form(
                //key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Welcom to Consciousleap", style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),),

                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter your name", style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold,fontFamily: "Comforta"),),

                        ],
                      ),SizedBox(height:7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child:TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                                    fontSize: 16.0,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0, // Adjust the vertical padding
                                    horizontal: 15.0, // Adjust the horizontal padding
                                  ),
                                  border: GradientOutlineInputBorder(
                                    width: 2,
                                    gradient: LinearGradient(
                                      colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please enter name';
                                  }
                                  return null;
                                },

                              ),

                          ),

                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter your email", style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold,fontFamily: "Comforta"),),

                        ],
                      ),SizedBox(height:7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Expanded(

                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                                    fontSize: 16.0,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.0, // Adjust the vertical padding
                                    horizontal: 15.0, // Adjust the horizontal padding
                                  ),
                                  border: GradientOutlineInputBorder(
                                    width: 2,
                                    gradient: LinearGradient(
                                      colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please enter email';
                                  }
                                  else if(!value.contains('@')){
                                    return 'Please enter valid email';
                                  }
                                  return null;
                                },
                              ),
                            ),

                        ],
                      ),




                      SizedBox(height: 40),

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

                                },
                                child: Text(
                                  'Start',
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

}