import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class JournalWidget extends StatelessWidget{

  String Journalname;
  String icons;
  Color color;
  double size;


  JournalWidget({
    required this.Journalname,
    required this.icons,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context){
    return Expanded(child:Container(
      width: 40,
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
                width: 40,
                height: 40,
                child:Image.asset(icons)
            ),
          ),

          SizedBox(
              height:10
          ),

          Text(Journalname,style: TextStyle(fontSize:size,fontFamily: "Comforta",color:Color(0xff4961AC)),textAlign: TextAlign.center,),
        ],
      ),
    ) );
      // Expanded(
      //   child: Padding(
      //       padding: EdgeInsets.only(top:20,left: 10,right: 10),
      //       child:Container(
      //         width: 318,
      //         height:163,
      //
      //         decoration: BoxDecoration(
      //
      //           image: DecorationImage(
      //             image: AssetImage('assets/images/background.png'),
      //             fit: BoxFit.cover,
      //
      //           ),
      //           borderRadius:
      //           BorderRadius.circular(8.0),
      //         ),
      //         child:Column(
      //           children: [
      //            Center(
      //             child:Text(Journalname,style:TextStyle(fontSize: 17,color: Colors.white),textAlign: TextAlign.center,),
      //            ),
      //
      //           ],
      //         ),
      //
      //
      //       )
      //   ));

  }
}