import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/size.dart';

Widget ConsciousStoreCheckoutElements({cart,address,shipping,payment,complete}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.shopping_cart,size: cartIconsSize,color: Color(0xff4961AC),),
      Icon(Icons.arrow_forward_ios_outlined,size: cartIconsSize,color: (address)?Color(0xff4961AC):Colors.grey,),
      Icon(Icons.map_outlined,size: cartIconsSize,color: (address)?Color(0xff4961AC):Colors.grey,),
      Icon(Icons.arrow_forward_ios_outlined,size: cartIconsSize,color: (shipping)?Color(0xff4961AC):Colors.grey,),
      Icon(Icons.delivery_dining_outlined,size: cartIconsSize,color:(shipping)?Color(0xff4961AC):Colors.grey,),
      Icon(Icons.arrow_forward_ios_outlined,size: cartIconsSize,color: (payment)?Color(0xff4961AC):Colors.grey,),
      Icon(Icons.credit_card_outlined,size: cartIconsSize,color: (payment)?Color(0xff4961AC):Colors.grey,),
      Icon(Icons.arrow_forward_ios_outlined,size: cartIconsSize,color:(complete)?Color(0xff4961AC):Colors.grey,),
      Icon(Icons.done_all_outlined,size: cartIconsSize,color: (complete)?Color(0xff4961AC):Colors.grey,)

    ],
  );
}