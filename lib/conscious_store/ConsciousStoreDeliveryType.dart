import 'package:consciousleap/conscious_store/ConsciousStorePayment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/images.dart';
import '../customWidgets/ConsciosStoreElements.dart';

class DeliveryType extends StatefulWidget {
  const DeliveryType({Key? key}) : super(key: key);

  @override
  State<DeliveryType> createState() => _DeliveryTypeState();
}

class _DeliveryTypeState extends State<DeliveryType> {
  int _selectedValue = 1; // The initially selected value.

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: context.screenWidth*.4,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RadioListTile(value: 1, groupValue: _selectedValue, onChanged: _handleRadioValueChanged,title: "Home Delivery".text.size(16).black.make(),),
                        ],
                      )
                  ).box.border(color: Vx.gray500,width: 1).roundedSM.make(),
                  Container(
                      width: context.screenWidth*.4,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RadioListTile(value: 2, groupValue: _selectedValue, onChanged: _handleRadioValueChanged,title: "Local Pickup".text.size(16).black.make(),),


                        ],
                      )
                  ).box.border(color: Vx.gray500,width: 1).roundedSM.make(),
                ],
              ),
              30.heightBox,
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()
                    ));
              }, child: "Continue to Payment".text.white.make(),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)).box.width(context.screenWidth*.8).make()


            ],
          ),
        ),
      ),
    );
  }
}
