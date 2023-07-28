import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/widgets/CustomInputBorder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// Page of Doctor Profile

class ConsciousCategories extends StatefulWidget {
  @override
  _ConsciousCategoriesState createState() => _ConsciousCategoriesState();
}

class _ConsciousCategoriesState extends State<ConsciousCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 15),
                child: Text("Conscious Product Categories",style: TextStyle(fontWeight:FontWeight.bold ,color:Color(0xff4961AC),fontSize: 17),),),

              GridView.extent(
                maxCrossAxisExtent: 200,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                mainAxisSpacing: 20,
                crossAxisSpacing: 30,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "consciousleap Vendibles"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Oneness Vendibles"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Conscious Being"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Conscious Living"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Conscious Eating"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Conscious Healing"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Conscious Kids"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Conscious Teens"),
                  ),

                ],
              ),
            ],
          ),
        ),

      ),
          );
  }
}

// class GradientBorderCard extends StatelessWidget {
//   final String btnNames;
//
//   const GradientBorderCard({required this.btnNames});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.blue, Colors.green],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//         child: Text(
//           btnNames,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }
