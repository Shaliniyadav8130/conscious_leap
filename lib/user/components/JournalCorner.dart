import 'package:consciousleap/user/components/JournalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class JournalCorner extends StatelessWidget{

  String name;
  JournalCorner({
    required this.name,
  });

  @override
  Widget build(BuildContext context){
    return Expanded(child: Padding(
      padding: EdgeInsets.only(top:20,left: 10,right: 10),
      child:Container(
        width: 318,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(8.0),
        ),
        child:Column(
          children: [
            Center(
              child:Padding(
                padding: EdgeInsets.only(top:5),
                child:Text(name,style:TextStyle(fontSize: 20,fontFamily:"Comforta",color: Colors.black),textAlign: TextAlign.center,),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom:10,left:16,right:16,top:16),
              child:Row(
                children: [
                  JournalWidget(icons:"assets/images/Asset 3@4x-1.png",Journalname: "Thought Tracker",size: 13,color:Colors.white,),
                  SizedBox(width:5),
                  JournalWidget(icons:"assets/images/Asset 1@4x.png",Journalname: "Things I like about myself",size: 13,color:Colors.white,),
                  SizedBox(width: 5,),
                  JournalWidget(icons:"assets/images/Asset 4@4x-1.png",Journalname: "Things I am grateful for",size: 13,color:Colors.white,),

                ],
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.only(bottom:10,left:16,right:16),
            //   child: GridView.count(
            //     shrinkWrap: true,
            //     crossAxisCount: 3,
            //     physics: NeverScrollableScrollPhysics(),
            //     //mainAxisSpacing: 15.0,
            //     crossAxisSpacing: 18.0,
            //     children: [
            //       JournalWidget(icons:"assets/images/Asset 3@4x-1.png",Journalname: "Thought Tracker",size: 12,color:Colors.white,),
            //       JournalWidget(icons:"assets/images/Asset 1@4x.png",Journalname: "Things I like about myself",size: 12,color:Colors.white,),
            //       JournalWidget(icons:"assets/images/Asset 4@4x-1.png",Journalname: "Things I am grateful for",size: 12,color:Colors.white,),
            //       // Add more Therapy widgets as needed
            //     ],
            //   ),
            //
            // ),
          ],
        ),
        // child:Padding(
        //   padding: EdgeInsets.only(top:5),
        //   child:Text(name,style:TextStyle(fontSize: 17,color: Colors.black),textAlign: TextAlign.center,),
        // ),

      ),



    ));

  }
}