import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class FeelingWidget extends StatelessWidget{

  String Feelingname;
  String icons;
  Color color;
  double size;


  FeelingWidget({
    required this.Feelingname,
    required this.icons,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context){
    return Container(
        width: 70,
        height: 100,
        decoration: BoxDecoration(
            color:color,
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12)),
        child:Column(
          children: [
            Padding(padding: EdgeInsets.only(top:10,bottom:8),
              child:
              SizedBox(
                  width: 40,
                  height:40,
                  child:Image.asset(icons)
              ),),

            Text(Feelingname,style:TextStyle(fontSize:size,color:Color(0xff4961AC)))
          ],
        )

    );

  }
}