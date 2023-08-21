import 'package:consciousleap/Constants/size.dart';
import 'package:consciousleap/conscious_store/ConsciousAddress.dart';
import 'package:consciousleap/customWidgets/ConsciosStoreElements.dart';
import 'package:consciousleap/customWidgets/ConsciousCartCard.dart';
import 'package:consciousleap/customWidgets/OrderDetails.dart';
import 'package:consciousleap/customWidgets/OrderSummary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            child:
            SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Column(
                children: [
                  15.heightBox,
                  Icon(Icons.verified_outlined,color: Colors.green,),
                  5.heightBox,
                  Text("Thank You for Your Order!",style:TextStyle(fontSize: 18,fontFamily: "Comforta",fontWeight: FontWeight.bold)),
                  10.heightBox,
                  Center(
                    child: Text(
                      "A copy of your order summary has been sent to customer1@gmail.com",
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  15.heightBox,
                  OrderSummary(),
                  10.heightBox,
                  Divider(),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Order Code".text.size(17).black.make(),
                      "2002348-849939".text.size(18).color(Color(0xff4961AC)).fontWeight(FontWeight.bold).make()
                    ],
                  ),
                  8.heightBox,
                  Divider(),
                  8.heightBox,
                  OrderDetails()
                ],
              ),
            )
        ),
      ),
    );
  }
}
