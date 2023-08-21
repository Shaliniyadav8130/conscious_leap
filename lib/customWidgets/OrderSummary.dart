import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../Constants/images.dart';

Widget OrderSummary(){
  return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
        Column(
            children: [
              Row(
                  children: [
                    "Order Summary".text.size(21).black.fontFamily("Comforta").fontWeight(FontWeight.bold).make()

                  ]),
              Divider(),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Order Date:".text.size(17).black.make(),
                  "13-08-2023 07:15pm".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Name:".text.size(17).black.make(),
                  "customer1".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Email:".text.size(17).black.make(),
                  "customer1@gmail.com".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Shipping Address:".text.size(17).black.make(),
                  "wdsad".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Order Status:".text.size(17).black.make(),
                  "Pending".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Total Order Amount:".text.size(17).black.make(),
                  "INR990.00".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Shipping:".text.size(17).black.make(),
                  "Flat Shipping Rate".text.size(16).gray400.make()
                ],
              ),
              8.heightBox,
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Payment method:".text.size(17).black.make(),
                  "Cash on Delivery".text.size(16).gray400.make()
                ],
              ),
              10.heightBox

            ]
        ),
      )
  );
}