//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:consciousleap/therapist/doctorProfile.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// // List of the Therapist Page
//
// class TherapistListtWidget extends StatelessWidget {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   Stream<QuerySnapshot<Map<String, dynamic>>> getUsersStream() {
//     return firestore.collection('Therapists').snapshots();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: getUsersStream(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text('Loading');
//         }
//
//         final List<QueryDocumentSnapshot<Map<String, dynamic>>> users = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: users.length,
//           itemBuilder: (BuildContext context, int index) {
//             final userData = users[index].data();
//
//             return ListTile(
//               // title: Text(userData['name']),
//               subtitle: Text(userData['experiece']),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
