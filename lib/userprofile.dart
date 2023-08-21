// import 'package:consciousleap/Activity_page3.dart';
// import 'package:consciousleap/authentication/PhoneAuthentication.dart';
// import 'package:consciousleap/user/UserDashboard.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class Authenticate extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     if (_auth.currentUser != null) {
//       return Activity_page3();
//     } else {
//       return PhoneAuthentication();
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardScreen extends StatelessWidget {
  final String phoneNumber; // Add a parameter for the phone number

  DashboardScreen(this.phoneNumber); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('TherapistData').doc(phoneNumber).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> userData = snapshot.data!.data() as Map<String, dynamic>;
            String name = userData['name'];
            String email = userData['email'];
            return Scaffold(
              appBar: AppBar(title: Text('Dashboard')),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome, $name'),
                  Text('Email: $email'),
                  // Add more widgets as needed
                ],
              ),
            );
          } else {
            // Data not found, handle accordingly
            return Scaffold(
              appBar: AppBar(title: Text('Dashboard')),
              body: Center(
                child: Text('User data not found'),
              ),
            );
          }
        }
        // Show loading indicator or handle other states
        return Scaffold(
          appBar: AppBar(title: Text('Dashboard')),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
