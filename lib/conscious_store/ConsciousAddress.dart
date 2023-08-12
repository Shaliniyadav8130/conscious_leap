import 'package:consciousleap/conscious_store/ConsciousStoreDeliveryType.dart';
import 'package:consciousleap/customWidgets/ConsciosStoreElements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ConsciousAddress extends StatelessWidget {
  const ConsciousAddress({Key? key}) : super(key: key);

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
              ConsciousStoreCheckoutElements(address: true,shipping: false,payment: false,complete: false),
              30.heightBox,
              Container(
                width: context.screenWidth*.8,

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          "Address".text.semiBold.gray400.make(),
                          10.widthBox,
                          "Address bhgh hfyfhj hbv".text.black.make()
                        ],
                      ),
                      Row(
                        children: [
                          "Postal Code".text.semiBold.gray400.make(),
                          10.widthBox,
                          "Address bhgh hfyfhj hbv".text.black.make()
                        ],
                      ),
                      Row(
                        children: [
                          "City".text.semiBold.gray400.make(),
                          10.widthBox,
                          "Address bhgh hfyfhj hbv".text.black.make()
                        ],
                      ),
                      Row(
                        children: [
                          "State".text.semiBold.gray400.make(),
                          10.widthBox,
                          "Address bhgh hfyfhj hbv".text.black.make()
                        ],
                      ),
                      Row(
                        children: [
                          "Country".text.semiBold.gray400.make(),
                          10.widthBox,
                          "Address bhgh hfyfhj hbv".text.black.make()
                        ],
                      ),
                      Row(
                        children: [
                          "Phone".text.semiBold.gray400.make(),
                          10.widthBox,
                          "Address bhgh hfyfhj hbv".text.black.make()
                        ],
                      )
                    ],
                  ),
                )
              ).box.border(color: Vx.gray500,width: 1).roundedSM.make(),
              15.heightBox,
              Container(
                  width: context.screenWidth*.8,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      "Add new address".text.size(21).black.make(),
                      8.heightBox,
                      Icon(Icons.add,color: Colors.black,size: 30,)

                    ],
                  )
              ).box.border(color: Vx.gray500,width: 1).roundedSM.make(),
              10.heightBox,
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeliveryType()
                    ));
              }, child: "Continue to delivery".text.white.make(),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)).box.width(context.screenWidth*.8).make()


            ],
          ),
        ),
      ),
    );
  }
}
