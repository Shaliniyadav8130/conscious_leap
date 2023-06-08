//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// // List of the Therapist Page
//
// class TherapistList extends StatefulWidget {
//
//   const TherapistList({
//     Key? key,
//   }) : super(key:key);
//
//   @override
//   State<TherapistList> createState() => _TherapistListState();
// }
//
// class _TherapistListState extends State<TherapistList> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: ListView.builder(itemBuilder: (context,index){
//         return Container(
//                 padding:EdgeInsets.symmetric(horizontal:15),
//                 width: double.infinity,
//                 height: 320,
//                 //color: Colors.deepOrange,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                             Container(
//                               //margin: EdgeInsets.only(top:10),
//                               width: 140,
//                               height: 140,
//                               //height: 150,
//                               decoration: BoxDecoration(
//                                   border: const GradientBoxBorder(
//                                     gradient: LinearGradient(colors: [Colors.blueAccent, Colors.deepOrange,Colors.cyanAccent]),
//                                     width: 2,
//                                   ),
//                                   borderRadius: BorderRadius.circular(70)),
//                               child:
//                               CircleAvatar(
//                                 radius: 60, // Adjust the radius to set the size of the avatar
//                                 backgroundImage: AssetImage('assets/images/doctor.jpg'), // Set the image for the avatar         // Alternatively, you can use `backgroundColor` and `child` properties to customize the appearance of the avatar
//                               ),
//                             ),
//
//
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Container(
//                           width: 220,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Sagrikaa Rastogi",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Color(0xff4961AC)),),
//                               Text("Counselling Psychologist, M.A",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Colors.black),),
//                               Text("3+ Years of experience",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Colors.black),),
//                               Padding(padding: EdgeInsets.only(top:3,bottom: 3),
//                                 child:Text("Expertise",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Color(0xff4961AC)),),
//                               ),
//                               Text("\u2022 Anxiety",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Colors.black),),
//                               Text("\u2022 Emotional Distress",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Colors.black),),
//                               Text("\u2022 Trauma",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Colors.black),),
//                               Text("\u2022 Stress",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Colors.black),),
//                               Text("\u2022 Productivity Concerns",style: TextStyle(fontSize: 14,fontFamily: 'Comforta',color: Colors.black),),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     ),
//
//                     SizedBox(height: 40,),
//
//                     Row(
//                       children: [
//                       Container(
//
//                       width:170,
//                       height: 40,
//                       //margin: EdgeInsets.only(bottom: 20.0),
//                       decoration: BoxDecoration(
//                           border: const GradientBoxBorder(
//                             gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(12)),
//
//                       child:TextButton(
//                         style: ButtonStyle(
//                           overlayColor: MaterialStateProperty.all(Colors.transparent), // Set overlay color to transparent to remove the ripple effect
//                         ),
//                         child: Text("View Profile",style: TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta'),),
//                         onPressed:(){
//
//                         },
//                       ),
//
//
//                     ),
//                         SizedBox(width: 20,),
//                         Container(
//                           width:170,
//                           height: 40,
//                           child:ElevatedButton(
//                             child:Text("Schedule Session" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
//                             onPressed:(){
//
//                               },
//
//
//                             style: ElevatedButton.styleFrom(
//                               primary: Color(0xff4961AC),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.only(top:20),
//                       child:Container(
//                         height: 1.0,
//                         width:350,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                         ),
//                       ),),
//                   ],
//
//                 ),
//         );
//
//       },
//       itemCount: 4),
//     );
//   }
// }
//
//
//
//
//
