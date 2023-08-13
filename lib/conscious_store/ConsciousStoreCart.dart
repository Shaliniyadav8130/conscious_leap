import 'package:consciousleap/Constants/size.dart';
import 'package:consciousleap/conscious_store/ConsciousAddress.dart';
import 'package:consciousleap/customWidgets/ConsciosStoreElements.dart';
import 'package:consciousleap/customWidgets/ConsciousCartCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ConsciousStoreCart extends StatelessWidget {
  const ConsciousStoreCart({Key? key}) : super(key: key);

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
                ConsciousStoreCheckoutElements(address: false,shipping: false,payment: false,complete: false),
                15.heightBox,
                MyCartCard(),
                MyCartCard(),
                MyCartCard(),
                MyCartCard(),
                MyCartCard(),
                10.heightBox,
                Divider(),
                8.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Total".text.size(17).gray400.make(),
                    "INR9500.00".text.size(18).black.make()
                  ],
                ),
                8.heightBox,
                Divider(),
                8.heightBox,
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: "Back".text.black.make(),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ConsciousAddress()),
                            );
                          },
                          child: "Continue".text.white.make(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff4961AC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
