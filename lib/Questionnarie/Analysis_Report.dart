import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:consciousleap/Questionnarie/questionnarie.dart';

// Analysis Report of Questionnarie Page

class Analysis_Report extends StatelessWidget{
  final List<double> categoryPercentages;

  Analysis_Report(this.categoryPercentages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
       body: SingleChildScrollView(
         child:Column(
           children: [
             Padding(
               padding: EdgeInsets.only(bottom:20),
               child:Text("Initial Analysis",style: TextStyle(decoration: TextDecoration.underline,fontSize: 24,fontFamily: 'Comforta',fontWeight: FontWeight.bold),),
             ),
             Column(
               children:  List.generate(categoryPercentages.length, (index) {
                 double percentage = categoryPercentages[index];
                 String categoryText = '';
                 String categoryImage;
                 String categoryName = '';

                 if (index == 0) {
                   categoryName = "Environmental Mastery";
                   categoryImage = 'assets/images/ic1.png';
                   // Environmental Mastery category
                   if (percentage <= 30) {
                     categoryText = 'You have difficulty managing everyday affairs; feel unable to change or improve surrounding contexts; are unaware of surrounding opportunities; and lack a sense of control over the external world.';
                   } else if (percentage >= 31 && percentage <= 50) {
                     categoryText = 'You are committed to improving your ability to manage everyday affairs and are open to exploring new opportunities that can positively impact your surroundings. You may have previously felt a lack.';
                   } else if (percentage >=51 && percentage <=70){
                     categoryText = 'You have a good sense of mastery & competence in managing the environment;and you control complex external activities; and you make effective use of your surrounding opportunities very well.';
                   }else{
                     categoryText = 'You have a high sense of mastery & competence in managing the environment; and you control complex external activities; and you make effective use of your surrounding opportunitiesvery well.';
                   }
                 } else if (index == 1) {
                   categoryName = "Purpose in Life";
                   categoryImage = 'assets/images/ic2.png';
                   // Purpose category
                   if (percentage <= 30) {
                     categoryText = 'You lack a sense of meaning in life; have few goals or aims, lack a sense of direction; do not see purpose of your past life; and you have no outlook or beliefs that give life meaning.';
                   } else if (percentage >= 31 && percentage <= 50) {
                     categoryText = 'You are in the process of discovering your sense of purpose and creating meaningful goals for yourself. While you may have felt directionless in the past, you are now exploring different outlooks.';
                   } else if(percentage >=51 && percentage <=70){
                     categoryText = 'You depict good sense of directedness;and you  feel there is meaning to your present and past life;and you hold your beliefs that give life purpose; and you have aims and objectives for living.';
                   }
                   else{
                     categoryText = 'You depict high sense of directedness; and you feel there is meaning to your present and past life; and you hold beliefs that give life purpose; and  you have aims and objectives for living.';
                   }
                 }
                 else if (index == 2) {
                   categoryName = "Self Acceptance";
                   categoryImage = 'assets/images/ic3.png';
                   // Self Acceptance Category
                   if (percentage <= 30) {
                     categoryText = 'You feel dissatisfied with yourself; are disappointed with what has occurred in your past life; are troubled about certain personal qualities; and wish to be different than what you are.';
                   } else if (percentage >= 31 && percentage <= 50) {
                     categoryText = 'You possess a low level of self-awareness and are actively working towards personal growth and development. While acknowledging your past experiences and  your personal own traits.';
                   } else if(percentage >=51 && percentage <=70){
                     categoryText = 'You possess a positive attitude toward yourself;and you  acknowledge the facts and accept multiple aspects of yourself including both good and bad qualities; and feel positive about your past life.';
                   }
                   else{
                     categoryText = 'You possess a highly positive attitude toward yourself; acknowledge and accept multiple aspects of yourself including both good and bad qualities; and feel positive about your past life.';
                   }
                 }
                 else if (index == 3) {
                   categoryName = "Relations with Others";
                   categoryImage = 'assets/images/ic4.png';
                   // Purpose category
                   if (percentage <= 30) {
                     categoryText = 'You have few close, trusting relationships with others; find it difficult to be warm, open, and you are concerned about others; and you are isolated and frustrated in interpersonal relationships.';
                   } else if (percentage >= 31 && percentage <= 50) {
                     categoryText = 'You cherish your close relationships and are working towards improving your ability to show warmth, openness, and concern towards others,feeling isolation and frustration in interpersonal relationships.';
                   } else if(percentage >=31 && percentage <=70){
                     categoryText = 'You have warm, satisfying, trusting relationships with others; are concerned about the welfare of others; are capable of strong empathy, affection, and intimacy; and understand  relationships.';
                   }
                   else{
                     categoryText = 'You have very warm, satisfying, trusting relationships with others; are concerned about the welfare of others; are capable of strong empathy, affection, and intimacy; and understand  human relationships.';
                   }
                 }
                 else {
                   // Default category
                   categoryImage = 'assets/images/Group 1.png';
                 }

                 return Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Column(
                       children: [
                         Padding(
                           padding: EdgeInsets.only(bottom:20),
                           child: ConstrainedBox(
                             constraints: BoxConstraints(
                               maxWidth: 370,
                               maxHeight: 150,
                             ),
                             child: Container(
                               width: 350,
                               height: 125,
                               decoration: BoxDecoration(
                                   border: const GradientBoxBorder(
                                     gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                                     width: 2,
                                   ),
                                   borderRadius: BorderRadius.circular(65)),
                               child: Row(
                                 children: [
                                   Padding(padding:EdgeInsets.all(6),
                                     child: SizedBox(
                                       height:48,
                                       width: 48,
                                       child: Image.asset(categoryImage),
                                     ),
                                   ),
                                   Container(
                                     width: 115,
                                     height: 130,
                                     decoration: BoxDecoration(
                                       border: Border.all(
                                         color: Color(0xff4961AC),
                                         width: 2.0,
                                       ),
                                       borderRadius: BorderRadius.circular(70.0),
                                     ),
                                     child:Padding(
                                       padding: EdgeInsets.only(top:40),
                                       child: Text('${percentage.toStringAsFixed(2)}%',style: TextStyle(fontSize: 18,fontFamily: 'Comforta',color:Color(0xff4961AC) ,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                     ),

                                   ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Center(
                                         child:Padding(
                                           padding: EdgeInsets.all(6),
                                           child:Text("${categoryName}",style: TextStyle(fontSize: 10,fontFamily: 'Comforta',fontWeight: FontWeight.bold),),
                                         ),

                                       ),
                                       Center(
                                         child:SizedBox(
                                           width: 165,
                                           child:Text("${categoryText}",style: TextStyle(fontSize: 8,fontFamily: 'Comforta'),textAlign: TextAlign.center,),
                                         ),

                                       ),


                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),

                       ],
                     ),
                   ],
                 );
               },
               ),


             ),
             Container(
               width: 100,
               height: 50,
               decoration: BoxDecoration(
                   color: Color(0xff4961AC),
                   // border: const GradientBoxBorder(
                   //   gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                   //   width: 2,
                   //),
                   borderRadius: BorderRadius.circular(12)),
               child: TextButton(
                 onPressed: () {

                 },
                 child: Text('Reset',style: TextStyle(fontFamily: 'Comforta',color: Colors.white),),
               ),
             ),
           ],
         ),

       ),

    );
  }

}