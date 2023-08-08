import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/images.dart';
import '../customWidgets/ConsciosStoreElements.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isChecked1 = false;
  void _handleCheckbox1Changed(bool? value) {
    setState(() {
      _isChecked1 = value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
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
                20.heightBox,
                Row(
                  children: [
                    Checkbox(

                      value: _isChecked1,
                      onChanged: _handleCheckbox1Changed,
                    ),
                    Expanded(child: "I agree to the terms and conditions,privacy policy and return policy".text.black.make())
                  ],
                ),
                20.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        Row(
                            children: [
                              "Summary".text.size(21).black.fontFamily('Comforta').make()

                            ]),
                        Divider(),
                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Product".text.size(17).black.semiBold.fontFamily("Comforta").make(),
                            "Total".text.size(18).semiBold.fontFamily("Comforta").black.make()
                          ],
                        ),
                        Divider(color: Colors.black,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "T- Shirt black * 1".text.size(17).black.fontFamily("Comforta").make(),
                            "AED12355.00".text.size(18).fontFamily("Comforta").black.make()
                          ],
                        ),
                        20.heightBox,
                        Divider(),
                        5.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Subtotal".text.size(17).gray400.make(),
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
                            "Total Shipping ".text.size(17).gray400.make(),
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

                        Divider(),
                        10.heightBox

                      ]
                  ),
                ),
                30.heightBox,
                ElevatedButton(onPressed: (){}, child: "Proceed".text.white.make(),style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent)).box.width(context.screenWidth*.8).make()


              ],
            ),
          ),
        ),
      ),
    );;
  }
}
