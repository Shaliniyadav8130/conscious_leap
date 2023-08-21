// import 'package:consciousleap/Activity_page3.dart';
// import 'package:consciousleap/Oneness.dart';
// import 'package:consciousleap/authentication/PhoneAuthentication.dart';
// import 'package:consciousleap/user/UserDashboard.dart';
// import 'package:consciousleap/userprofile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
//
// class Authenticate extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final String phoneNumber;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<bool> checkDataInTherapistData(String userId) async {
//     try {
//       DocumentSnapshot snapshot =
//       await _firestore.collection('TherapistData').doc(userId).get();
//       return snapshot.exists;
//     } catch (e) {
//       print('Error checking data in TherapistData collection: $e');
//       return false;
//     }
//   }
//
//
//   Authenticate(this.phoneNumber);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<UserCredential?>(
//       future: _auth.signInAnonymously(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // You can show a loading indicator here if needed
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           // Handle error if authentication fails
//           return Text('Error: ${snapshot.error}');
//         } else {
//           User? user = snapshot.data?.user;
//
//           //if (user != null) {
//             // Check if data exists in TherapistData collection
//             //bool dataExistsInTherapistData = await checkDataInTherapistData(user.uid);
//
//             //if (dataExistsInTherapistData) {
//               //return DashboardScreen(phoneNumber); // Navigate to Therapist Dashboard
//             //} else {
//             //  return UserDashboard(); // Navigate to User Dashboard
//             //}
//           //} else {
//             //return PhoneAuthentication(); // Navigate to Phone Authentication
//           }
//         }
//       },
//     );
//   }
// }
