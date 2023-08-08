import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/images.dart';
import '../customWidgets/ConsciosStoreElements.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              15.heightBox,
              ConsciousStoreCheckoutElements(address: true,shipping:true,payment: true,complete: false),
              30.heightBox,
              "Any Additional Info?".text.fontFamily('Comforta').black.semiBold.align(TextAlign.start).make(),
              10.heightBox,
              TextFormField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "Type your text..",
                  hintStyle: TextStyle(
                    fontFamily: 'Comforta',
                  ),
                  border: OutlineInputBorder(

                  )
                ),
              ),
              20.heightBox,
              "Select payment option".text.fontFamily('Comforta').black.semiBold.align(TextAlign.start).make(),
              10.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: "Stripe".text.fontFamily("Comforta").center.size(21).make(),
                  ).box.border().height(80).width(context.screenWidth*.4).roundedSM.make(),
                  Container(
                    alignment: Alignment.center,
                    child: "Stripe".text.fontFamily("Comforta").center.size(21).make(),
                  ).box.border().height(80).width(context.screenWidth*.4).roundedSM.make()
                ],
              ),
              10.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: "Stripe".text.fontFamily("Comforta").center.size(21).make(),
                  ).box.border().height(80).width(context.screenWidth*.4).roundedSM.make(),
                  Container(
                    alignment: Alignment.center,
                    child: "Stripe".text.fontFamily("Comforta").center.size(21).make(),
                  ).box.border().height(80).width(context.screenWidth*.4).roundedSM.make()
                ],
              ),
              30.heightBox,
              ElevatedButton(onPressed: (){}, child: "Proceed".text.white.make(),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)).box.width(context.screenWidth*.8).make()


            ],
          ),
        ),
      ),
    );;
  }
}
