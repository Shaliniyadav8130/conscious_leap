import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class TasksWidget extends StatelessWidget{

  String Taskname;
  String icons;
  Color color;
  double size;


  TasksWidget({
    required this.Taskname,
    required this.icons,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context){
    return
        Column(
          children: [
        Container(
        width: 108,
          height: 120,
          decoration: BoxDecoration(
              color:color,
              border: const GradientBoxBorder(
                gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12)),
          child:Column(
            children: [
              Padding(
                padding:EdgeInsets.only(top:10,bottom:7),
                child:SizedBox(
                    width: 50,
                    height: 50,
                    child:Image.asset(icons)
                ),
              ),

              SizedBox(
                  height:10
              ),

              Text(Taskname,style: TextStyle(fontSize:size,fontFamily: "Comforta",color:Color(0xff4961AC)),textAlign: TextAlign.center,),
            ],
          ),
        ),



            SizedBox(height:10),
            Container(
              width:30,
              height:30,
              decoration: BoxDecoration(
                  color:color,
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8)),
            )
          ],
        );

  }
}