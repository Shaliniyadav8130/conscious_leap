import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class GradientBorderCard extends StatelessWidget{

  final String btnNames;
  final VoidCallback? callBack;


  GradientBorderCard({
    required this.btnNames,
    this.callBack
  });

  @override
  Widget build(BuildContext context){
    return Container(

      width:200,
      height: 200,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12)),

      child:TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent), // Set overlay color to transparent to remove the ripple effect
        ),
        child: Text(btnNames,style: TextStyle(fontSize:12,color: Colors.black,fontFamily:'Comforta'),textAlign: TextAlign.center,),
        onPressed:(){
          callBack!();
        },
      ),


    );
  }
}