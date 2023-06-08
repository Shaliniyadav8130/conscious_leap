import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page21.dart';
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
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [

            Text("Tele-Therapy Login"),
            Row(
              children: [
                Text("Email"),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: email, // Assign the TextEditingController instance
                    decoration: InputDecoration(
                        border: GradientOutlineInputBorder(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.green],  // Replace with your desired gradient colors
                          ),

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
              ],
            ),
            Row(
              children: [
                Text("Mobile"),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: email, // Assign the TextEditingController instance
                    decoration: InputDecoration(
                      border: GradientOutlineInputBorder(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.green],  // Replace with your desired gradient colors
                        ),

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
              ],
            ),

            SizedBox(height: 20),
            // Add more form fields as needed
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Perform form submission logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Form submitted')),
                  );
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
