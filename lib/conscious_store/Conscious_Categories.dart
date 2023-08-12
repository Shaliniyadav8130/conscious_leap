import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/conscious_store/Categories.dart';
import 'package:consciousleap/customWidgets/ConsciousStoreCard.dart';
import 'package:consciousleap/widgets/CustomInputBorder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/images.dart';

// Page of Conscious Store Categories

class ConsciousCategories extends StatefulWidget {
  @override
  _ConsciousCategoriesState createState() => _ConsciousCategoriesState();
}

class _ConsciousCategoriesState extends State<ConsciousCategories> {
  // String dropdownvalue = 'Item 1';
  //
  // // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body:
       //SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       //mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Padding(padding: EdgeInsets.only(bottom: 15),
      //           child: Text("Conscious Product Categories",style: TextStyle(fontWeight:FontWeight.bold ,color:Color(0xff4961AC),fontSize: 17),),),
      //
      //         Row(
      //           children: [
      //             Container(
      //               width: context.screenWidth*.5,
      //               child: Padding(
      //                 padding: EdgeInsets.all(8),
      //                 child:
      //                 DropdownButtonFormField(
      //                   itemHeight: 50,
      //                     elevation: 4,
      //
      //                     padding: EdgeInsets.all(0),
      //                     decoration: InputDecoration(border: OutlineInputBorder()),borderRadius: BorderRadius.circular(10),value:dropdownvalue,items: items.map((String items) {
      //                   return DropdownMenuItem(
      //                     value: items,
      //                     child: Text(items),
      //                   );
      //                 }).toList(), onChanged: (String? newValue) {
      //                   setState(() {
      //                     dropdownvalue = newValue!;
      //                   });
      //                 }),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child:
      //               Padding(
      //                 padding: EdgeInsets.all(8),
      //                 child: DropdownButtonFormField(value:dropdownvalue,items: items.map((String items) {
      //                   return DropdownMenuItem(
      //                     value: items,
      //                     child: Text(items),
      //                   );
      //                 }).toList(), onChanged: (String? newValue) {
      //                   setState(() {
      //                     dropdownvalue = newValue!;
      //                   });
      //                 }),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Container(
      //           padding: EdgeInsets.all(12),
      //           child: SingleChildScrollView(
      //           scrollDirection: Axis.vertical,
      //             physics: ScrollPhysics(),
      //             child: GridView.builder(shrinkWrap: true,
      //                 itemCount: 9,
      //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 14,crossAxisSpacing: 14,mainAxisExtent: 200), itemBuilder: (context,index){
      //                   return ConsciousStoreCard(
      //                     child: Column(
      //                       children: [
      //                         Image.asset(catImg1,height: 120,width: 200, fit: BoxFit.cover,),
      //                         "White-Tshirt".text.center.size(18).semiBold.make(),
      //
      //                         Padding(
      //                         padding: EdgeInsets.all(10),
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text("AED95.00",style: TextStyle(decoration: TextDecoration.lineThrough),
      //                             ),
      //                               Text("AED95.00",style: TextStyle(color: Colors.blueAccent)),
      //                           ],
      //                         ),
      //                       )],
      //
      //                     ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make(),
      //                   );
      //                 }),
      //           ),
      //         ),
              GridView.extent(
                maxCrossAxisExtent: 200,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                mainAxisSpacing: 20,
                crossAxisSpacing: 30,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "consciousleap Vendibles",
                        callBack: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>CategoryScreen()
                              ));
                        }
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Oneness Vendibles"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15,),
                    child:GradientBorderCard(btnNames: "Conscious Being",
                    ),
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
