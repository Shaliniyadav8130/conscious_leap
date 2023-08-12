import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class GradientBorderButton extends StatelessWidget{

  final String btnName;
  final VoidCallback? callBack;


  GradientBorderButton({
    required this.btnName,
    this.callBack
  });

  @override
  Widget build(BuildContext context){
    return Container(
      height:40,
      width:300,
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
        child: Text(btnName,style: TextStyle(fontSize:10,color: Colors.black,fontFamily:'Comforta'),),
        onPressed:(){
          callBack!();
        },
      ),


    );
}
}