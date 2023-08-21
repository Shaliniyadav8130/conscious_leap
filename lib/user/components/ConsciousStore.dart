import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// ConsciousStore user navigation from user Dashboard


class ConsciousStore extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Expanded(
      child:Container(
        width: 130,
        height:200,
        //color: Colors.white,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(8.0),
            color: Colors.white
        ),
        child:Column(
          children: [
            Padding(
              padding:EdgeInsets.all(7),
              child:Text("Conscious Store",style: TextStyle(fontSize: 16,fontFamily: "Comforta",color:Color(0xff4961AC)),textAlign: TextAlign.center,),
            ),

            Padding(
              padding: EdgeInsets.only(bottom:5),
              child:Container(
                width: 130,
                height: 130,
                  child: Image.asset(
                    "assets/images/Asset 8@4x 1.png",
                    fit: BoxFit.cover, // Adjusts the size of the image
                  ), // Adjusts the size of the image

              ),
            ),




          ],
        ),
        //child:Text(name,style:TextStyle(fontSize: 12),textAlign: TextAlign.center,),

      ),

    );
  }
}