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
       body:Column(
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
                   categoryText = 'You have difficulty in managing everyday affairs; feel unable to change or improve surrounding contexts; are unaware of surrounding opportunities; and lack a sense of control over the external world.';
                 } else if (percentage >= 31 && percentage <= 50) {
                   categoryText = 'You are committed to improving your ability to manage everyday affairs, and are open to exploring new opportunities that can positively impact your surroundings. Although you may have previously felt a lack of control over the external world, you remain optimistic and proactive in your efforts to create positive change in your environment.';
                 } else if (percentage >=51 && percentage <=70){
                   categoryText = 'You have a good sense of mastery & competence in managing environment; control complex external activities; make effective use of surrounding opportunities';
                 }else{
                   categoryText = "You have a high sense of mastery & competence in managing environment; control complex external activities; make effective use of surrounding opportunities.";
                 }
               } else if (index == 1) {
                 categoryName = "Purpose in Life";
                 categoryImage = 'assets/images/ic2.png';
                 // Purpose category
                 if (percentage <= 30) {
                   categoryText = 'You lack a sense of meaning in life; have few goals or aims; lacks a sense of direction; do not see purpose of your past life; and have no outlook or beliefs that give life meaning.';
                 } else if (percentage >= 31 && percentage <= 50) {
                   categoryText = 'You are in process of discovering your sense of purpose and creating meaningful goals for yourself. While you may have felt directionless in the past,you are now exploring different outlooks and beliefs that bring a sense of fulfillment and purpose to your life.';
                 } else if(percentage >=51 && percentage <=70){
                   categoryText = 'You depict good sense of directedness; feel there is meaning to your present and past life; hold beliefs that give life purpose; and have aims and objectives for living.';
                 }
                 else{
                   categoryText = 'You depict high sense of directedness; feel there is meaning to your present and past life; hold beliefs that give life purpose; and have aims and objectives for living.';
                 }
               }
               else if (index == 2) {
                 categoryName = "Self Acceptance";
                 categoryImage = 'assets/images/ic3.png';
                 // Self Acceptance Category
                 if (percentage <= 30) {
                   categoryText = 'You feel dissatisfied with yourself; are disappointed with what has occured in your past life; are are troubled about certain personal qualities; and wish to be different than what you are.';
                 } else if (percentage >= 31 && percentage <= 50) {
                   categoryText = 'You possess a low level of self-awareness and are actively working towards personal growth and development. While acknowledge your past experiences and personal traits,you strike to improve and become the best version of yourself. You are motivated and optimistic about the potential for positive change in your life.';
                 } else if(percentage >=51 && percentage <=70){
                   categoryText = 'You possess a positive attitude toward yourself; acknowledge and accept multiple aspects of yourself including both good and bad qualities; and feel positive about your past life.';
                 }
                 else{
                   categoryText = "You possess a highly positive attitude toward yourself; acknowledge and accept multiple aspects of yourself including both good and bad qualities; and feel positive about your past life.";
                 }
               }
               else if (index == 3) {
                 categoryName = "Relations with Others";
                 categoryImage = 'assets/images/ic4.png';
                 // Purpose category
                 if (percentage <= 30) {
                   categoryText = 'You have few close,trusting relationships with others; find it difficult to be warm,open,and concerned about others; are isolated and frustrated in interpersonal relationships.';
                 } else if (percentage >= 31 && percentage <= 50) {
                   categoryText = 'You cherish your close relationships and we are working towards improving your ability to show warmth,openess,and concerns towards others.While feeling some isolation and frustration in interpersonal relationships,you remain hopeful and committed to building fulfilling connections with others.';
                 } else if(percentage >=31 && percentage <=70){
                   categoryText = 'You have warm,satisfying,trusting relationship with others; are connected about the welfare of others;are capable of strong empathy, affection, and intimacy; and understand the give and take of human relationships.';
                 }
                 else{
                   categoryText = 'You have very warm, satisfying, trusting relationships with others; are concerned about the welfare of others; are capable of strong empathy, affection, and intimacy; and understand the give and take of human relationships.';
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
                             width: 370,
                             height: 125,
                             decoration: BoxDecoration(
                                 border: const GradientBoxBorder(
                                   gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                                   width: 2,
                                 ),
                                 borderRadius: BorderRadius.circular(65)),
                             child: Row(
                               children: [
                                 Padding(padding:EdgeInsets.all(7),
                                   child: SizedBox(
                                     height:50,
                                     width: 50,
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
                                         padding: EdgeInsets.all(8),
                                         child:Text("${categoryName}",style: TextStyle(fontSize: 10,fontFamily: 'Comforta',fontWeight: FontWeight.bold),),
                                       ),

                                     ),
                                     Center(
                                       child:SizedBox(
                                         width: 180,
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
               //ListTile(

               // title: Text('Category ${index + 1}'),
               // subtitle: Text('Percentage: ${percentage.toStringAsFixed(2)}%'),
               // trailing: Text(categoryText),
               //);
             },
             ),


           )
         ],
       ),

    );
  }

}