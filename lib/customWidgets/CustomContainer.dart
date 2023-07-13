import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

Widget? customContainer({child}){
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    decoration: BoxDecoration(
        border: const GradientBoxBorder(
          gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12)),
    child: child,
  );
}
