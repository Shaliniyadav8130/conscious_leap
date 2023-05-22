import 'package:consciousleap/Activity_page1.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Tele-Therapy Login",
                style: TextStyle(fontSize: 20, color: Colors.blueAccent),
              ),
              Row(
                children: [
                  Text("Email"),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: GradientOutlineInputBorder(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepOrange,
                              Colors.blueAccent,
                              Colors.cyanAccent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
