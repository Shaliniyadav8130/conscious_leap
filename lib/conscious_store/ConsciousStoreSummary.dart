import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/images.dart';
import '../customWidgets/ConsciosStoreElements.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              15.heightBox,
              ConsciousStoreCheckoutElements(address: true,shipping:true,payment: false,complete: false),
              30.heightBox,
              Row(
                  children: [
                    Image.asset(catImg1,height: 50,width: 70, fit: BoxFit.cover,),
                    "Cup White-Ghostwhite".text.size(21).gray400.make()

                  ]),
              Divider(),
              30.heightBox,
              
              30.heightBox,
              ElevatedButton(onPressed: (){}, child: "Continue to Payment".text.white.make(),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)).box.width(context.screenWidth*.8).make()


            ],
          ),
        ),
      ),
    );;
  }
}
