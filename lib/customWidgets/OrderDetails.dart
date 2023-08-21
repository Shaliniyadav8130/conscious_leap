import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../Constants/images.dart';

Widget OrderDetails(){
  return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
        Column(
            children: [
              Row(
                  children: [
                    "Order Details".text.size(21).black.fontFamily('Comforta') // Replace 'YourFontFamily' with the desired font family name
                        .fontWeight(FontWeight.bold) // You can use other FontWeight values like .normal, .w500, etc.
                        .make()

                  ]),
              Divider(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Product:".text.size(17).black.make(),
                  "Cup White".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Variation:".text.size(17).black.make(),
                  "GhostWhite".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Quantity:".text.size(17).black.make(),
                  "10".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Delivery Type:".text.size(17).black.make(),
                  "Home Delivery".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Price:".text.size(17).black.make(),
                  "INR990.00".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Subtotal:".text.size(17).black.make(),
                  "INR990.00".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Shipping:".text.size(17).black.make(),
                  "INR0.0".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Tax:".text.size(17).black.make(),
                  "INR45.00".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Coupon Discount:".text.size(17).black.make(),
                  "INR0.00".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Total:".text.size(17).black.make(),
                  "INR975.00".text.size(16).gray400.make()
                ],
              ),
              10.heightBox

            ]
        ),
      )
  );
}