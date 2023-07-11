import 'package:consciousleap/Therapist_Dashboard/components/TasksWidget.dart';
import 'package:consciousleap/user/components/JournalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class Tasks extends StatelessWidget{

  String name;
  Tasks({
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
                  Expanded(
                    child:TasksWidget(icons:"assets/images/ScheduledSession.png",Taskname: "Scheduled Session",size: 11,color:Colors.white,),
                  ),

                  SizedBox(width:5),
                  Expanded(child:TasksWidget(icons:"assets/images/FinishingUp.png",Taskname: "Finishing Up My TherapyNotes",size: 10,color:Colors.white,), ),

                  SizedBox(width: 5,),
                 Expanded(child:  TasksWidget(icons:"assets/images/Break.png",Taskname: "Taking a Break",size: 10,color:Colors.white,),)

                ],
              ),
            ),

          ],
        ),


      ),



    ));

  }
}