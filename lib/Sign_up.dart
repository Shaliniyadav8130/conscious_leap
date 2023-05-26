import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Activity_page4.dart';
import 'package:consciousleap/controllers/signup_controllers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:consciousleap/models/user_model.dart';

// class SignupView extends StatefulWidget {
//   @override
//   _SignupViewState createState() => _SignupViewState();
// }

class SignupView extends StatelessWidget {

  const SignupView({
    Key? key,
}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
      ),
      body:Row(
        key: _formKey,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 55.0),
                child:Text("Tele-Therapy Sign-up" ,style: TextStyle(color: Colors.blueAccent, fontSize: 25,fontFamily:'Comforta'),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("First Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width:250,
                      height:50,
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: controller.firstName,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),

                    ),
                    ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Last Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width:250,
                    height:50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller:controller.lastName,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Email",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 44,
                  ),
                  Container(
                    width:250,
                    height:50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mobile",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width:250,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        border: InputBorder.none,

                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                ],
              ),



              Container(
                width:340,
                margin: EdgeInsets.only(top: 20.0),
                child:ElevatedButton(
                   child:Text("Sign-Up" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                onPressed:(){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Activity_page3()
                      ));
                    if(_formKey.currentState!.validate()){
                     SignUpController.instance.registerUser(controller.email.text.trim(),controller.password.text.trim());
                   }
                  // final user = UserModel(
                  //     firstName:controller.firstName.text.trim(),
                  //    lastName:controller.lastName.text.trim(),
                  //    email: controller.email.text.trim(),
                  //    password: controller.password.text.trim(),
                  // );
                  //SignUpController.instance.createUser(user);

                 },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),

             ],
           ),
         ],
       ),
    );
  }

}

