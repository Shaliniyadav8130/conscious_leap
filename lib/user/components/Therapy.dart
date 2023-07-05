import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class Therapy extends StatelessWidget{

  String name;
  String icon;


  Therapy({
    required this.name,
    required this.icon
  });

  @override
  Widget build(BuildContext context){
    return Expanded(child: Container(
      width: 104,
      height:104,
      //color: Colors.white,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(8.0),
          color: Colors.white
      ),
      child:Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top:12),
            child: SizedBox(
              width: 55,
              height: 55,
              child: Image.asset(icon),
            ),
          ),
          SizedBox(
              height:6
          ),

          Text(name,style: TextStyle(fontSize: 8,fontFamily: "Comforta"),)
        ],
      ),
      //child:Text(name,style:TextStyle(fontSize: 12),textAlign: TextAlign.center,),

    ));

  }
}