import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../Constants/images.dart';

Widget MyCartCard(){
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
         children: [
           Image.asset(catImg1,height: 50,width: 70, fit: BoxFit.cover,),
           "Cup White-Ghostwhite".text.size(21).gray400.make()

         ]),
          Divider(),
          5.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Price".text.size(17).gray400.make(),
              "AAED9500.00".text.size(18).black.make()
            ],
          ),
          8.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Tax".text.size(17).gray400.make(),
              "AAED450.00".text.size(18).black.make()
            ],
          ),
          8.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Quantity".text.size(17).gray400.make(),
              "4".text.size(18).black.make()
            ],
          ),
          8.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Total".text.size(17).gray400.make(),
              "AAED9500.00".text.size(18).black.make()
            ],
          ),
          8.heightBox,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Price".text.size(17).gray400.make(),
              
              Icon(Icons.delete,color: Colors.blueAccent,)
            ],
          ),
          10.heightBox,
          Divider(),
          10.heightBox

        ]
      ),
    )
  );
}