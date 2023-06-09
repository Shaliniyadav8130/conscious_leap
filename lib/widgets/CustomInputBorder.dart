import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class GradientBorderCard extends StatelessWidget{

  final String cardName;
  //final VoidCallback? callBack;


  GradientBorderCard({
    required this.cardName,
    //this.callBack
  });

  @override
  Widget build(BuildContext context){
    return Container(
      width: 100,
      height: 90,
      decoration: BoxDecoration(
          border: const GradientBoxBorder(
            gradient: LinearGradient(colors: [
              Color(0xff4961AC),
              Color(0xffF2685D),
              Color(0xff4EC1BA)
            ]),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10)),

      child: Column(
        children: [
          Text(cardName, style: TextStyle(
              fontFamily: 'Comforta',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xff4961AC)),),

          Container(
            width: 100,
            height: 2,
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  Color(0xff4961AC),
                  Color(0xffF2685D),
                  Color(0xff4EC1BA)
                ]),
                width: 2,
              ),
              //borderRadius: BorderRadius.circular(10)
            ),
          ),


        ],
      ),
    );

  }
}