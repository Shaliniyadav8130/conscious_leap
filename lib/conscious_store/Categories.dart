import 'package:consciousleap/Constants/images.dart';
import 'package:consciousleap/conscious_store/ConsciousStoreCart.dart';
import 'package:consciousleap/conscious_store/ProductDetails.dart';
import 'package:consciousleap/customWidgets/ConsciousStoreCard.dart';
import 'package:consciousleap/user/components/ConsciousStore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String _selectedSize = 'Option 1'; // Initial selected item

  List<String> _dropdownSize = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: "Conscious Store".text.bold.black.make(),
        leading: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      body:
      Column(
        children: [
          DropdownButton<String>(
            isExpanded: true,
              value: _selectedSize,
              underline: Container(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSize = newValue!;
                });
              },
              items: _dropdownSize.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()).box.border(color: Colors.black12,width: 1.5).roundedSM.height(40).alignCenterLeft.padding(EdgeInsets.symmetric(horizontal: 8)).margin(EdgeInsets.symmetric(horizontal: 10)).make(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(shrinkWrap: true,
                  itemCount: 15,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 12,crossAxisSpacing: 12,mainAxisExtent: 300), itemBuilder: (context,index){
                    return InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>ProductDetails()
                              ));
                        },
                      child:ConsciousStoreCard(
                      child: Column(
                        children: [
                          Stack(children:
                          [Image.asset(catImg2,height: 130,width: 200, fit: BoxFit.cover,),
                          50.heightBox,
                          Container(
                            margin: EdgeInsets.fromLTRB(00, 40, 0, 0),
                            width: 63,
                            height: 35,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                            color: Colors.white,borderRadius: BorderRadius.only(
                              topRight: Radius.circular(17),
                              bottomRight: Radius.circular(17)

                            )),
                            child: Row(
                              children: [
                                2.widthBox,
                                "OFF".text.red600.semiBold.make(),
                                2.widthBox,
                                CircleAvatar(
                                  child: "5%".text.size(6).white.semiBold.make(),
                                  backgroundColor: Colors.deepOrange,
                                  radius: 15,
                                )
                              ],
                            ),
                          ).box.roundedSM.make()]),
                          10.heightBox,
                          "White-Tshirt".text.center.size(18).semiBold.make(),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("INR95.00",style: TextStyle(decoration: TextDecoration.lineThrough),
                                ),
                                Text("INR95.00",style: TextStyle(color: Color(0xff4961AC))),
                                10.heightBox,
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff4961AC)), // Set your desired background color here
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8), // Set a smaller border radius here
                                      ),
                                    ),
                                  ),
                                    onPressed: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ConsciousStoreCart()
                                          ));
                                    },
                                    child: Row(
                                  children: [
                                    Icon(Icons.shopping_cart,color: Colors.white,),
                                    10.widthBox,
                                    "Add to cart".text.white.semiBold.make()
                                  ],
                                ),
                                )
                              ],

                            ),
                          ),
                        ],

                      ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make(),
                      )
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
