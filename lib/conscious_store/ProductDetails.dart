import 'package:consciousleap/Constants/images.dart';
import 'package:consciousleap/conscious_store/ConsciousAddress.dart';
import 'package:consciousleap/conscious_store/ConsciousStoreCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String _selectedSize = 'Option 1'; // Initial selected item

  List<String> _dropdownSize = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  String _selectedFabric='Fabric1';
  List<String> _dropdownFabric=['Fabric1','Fabric2','Fabric3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          constraints: BoxConstraints.expand(),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(catImg1,height: 400,fit: BoxFit.fill,).box.white.margin(EdgeInsets.all(8)).border(color: Colors.grey,).make(),

                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "T-Shirt White".text.size(28).black.semiBold.make(),
                      8.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            "Share :".text.size(18).make(),

                            Icon(Icons.share,color: Colors.black,),

                          ],
                        ),
                      ),
                      Divider(color: Colors.grey,thickness: 1,height: 1,),
                      10.heightBox,
                      "Size :".text.gray400.size(18).align(TextAlign.start).make(),
                     5.heightBox,
                  DropdownButton<String>(
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
                    }).toList()).box.border(color: Colors.black12,width: 1.5).roundedSM.height(40).padding(EdgeInsets.symmetric(horizontal: 3)).make(),
                      15.heightBox,
                      "Fabric :".text.gray400.size(18).align(TextAlign.start).make(),
                      5.heightBox,
                      DropdownButton<String>(
                          value: _selectedFabric,
                          underline: Container(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedFabric = newValue!;
                            });
                          },
                          items: _dropdownFabric.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()).box.roundedSM.border(color: Colors.black12,width: 1.5).height(40).padding(EdgeInsets.symmetric(horizontal: 3)).make(),
                      15.heightBox,
                      "Fabric :".text.gray400.size(18).align(TextAlign.start).make(),
                      3.heightBox,
                      "INR100.00".text.lineThrough.size(28).color(Color(0xff4961AC)).make(),
                      15.heightBox,
                      "Fabric :".text.gray400.size(18).align(TextAlign.start).make(),
                      3.heightBox,
                      "INR95.00".text.size(28).color(Color(0xff4961AC)).make(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: ElevatedButton(
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
                                      MaterialPageRoute(builder: (context) =>ConsciousStoreCart()
                                      ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_cart,color: Colors.white,),
                                    10.widthBox,
                                    "Add to cart".text.center.white.semiBold.make()
                                  ],
                                ),
                              ),

                          ),

                          SizedBox(width:5),
                          Expanded(
                            child:ElevatedButton(
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
                                    MaterialPageRoute(builder: (context) =>ConsciousAddress()
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  "Buy it now".text.white.semiBold.make()
                                ],
                              ),
                            ),

                          ),

                        ],
                      ),


                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff4961AC)), // Set your desired background color here
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Set a smaller border radius here
                            ),
                          ),
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Add to Whishlist".text.white.semiBold.make()
                          ],
                        ),
                      )
                    ],
                  ),
                ).box.white.margin(EdgeInsets.symmetric(vertical: 2,horizontal: 8)).padding(EdgeInsets.all(8)).border(color: Colors.grey).make(),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Description".text.align(TextAlign.left).gray400.semiBold.size(21).make(),
                      5.heightBox,
                      Divider(height: 1,thickness: 1,color: Colors.grey,),
                      10.heightBox,
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                      .text.justify.gray800.make()
                    ],
                  ),
                ).box.white.margin(EdgeInsets.symmetric(vertical: 2,horizontal: 8)).padding(EdgeInsets.all(8)).border(color: Colors.grey).make()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
