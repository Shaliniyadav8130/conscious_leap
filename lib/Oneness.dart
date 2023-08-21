import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Chatbot/Faq_or_chatbot.dart';
import 'package:consciousleap/authentication/PhoneAuthentication.dart';
import 'package:consciousleap/conscious_Business/BusinessSelection.dart';
import 'package:consciousleap/conscious_Business/businessLogin.dart';
import 'package:consciousleap/conscious_store/conscious_login.dart';
import 'package:consciousleap/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Oneness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child:
              Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0,top:60),
                child: Text("Hi,", style: TextStyle(fontFamily: 'Comforta')),
              ),
              Text("I am oneness", style: TextStyle(fontFamily: 'Comforta')),
              Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/oneness_avatar.png'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Container(
                  width: 0.8 * screenWidth,
                  child: Text(
                    "your ever-mindful companion in your well-being journey at consciousleap",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Comforta'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "How can I help you today?",
                  style: TextStyle(fontFamily: 'Comforta'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptionButton(
                    context,
                    screenWidth,
                    'Therapy',
                    'assets/images/Therapy.png',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Activity_page1(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  _buildOptionButton(
                    context,
                    screenWidth,
                    'consciousleap for Business',
                    'assets/images/Handshake.png',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusinessSelection(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOptionButton(
                    context,
                    screenWidth,
                    'Conscious Store',
                    'assets/images/Shop-1.png',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => consciousLogin(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  _buildOptionButton(
                    context,
                    screenWidth,
                    'oneness',
                    'assets/images/oneness_avatar.png',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Faq_or_chatbot(),
                        ),
                      );
                    },
                  ),
                ],
              ),

            ],
          ),
              ),
          );

        },
      ),
    );
  }

  Widget _buildOptionButton(
      BuildContext context,
      double screenWidth,
      String title,
      String imagePath,
      VoidCallback onTap,
      ) {
    return Container(
      width: 0.40 * screenWidth,
      height: 140,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        border: const GradientBoxBorder(
          gradient: LinearGradient(
            colors: [Color(0xff4961AC), Color(0xffF2685D), Color(0xff4EC1BA)],
          ),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(imagePath),
              ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xff4961AC),
                  fontFamily: "Comforta",
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
