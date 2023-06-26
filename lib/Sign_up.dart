
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/controllers/signup_controllers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:consciousleap/models/UserModel.dart';
import 'package:gradient_borders/gradient_borders.dart';

// Signup Page for a new User
class SignupView extends StatefulWidget {

  const SignupView({
    Key? key,
  }) : super(key:key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final controller = Get.put(SignUpController());
  String email = "";
  String firstname = "";
  String lastname = "";
  var db = FirebaseFirestore.instance;
  String password = "";


  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
       appBar: AppBar(
       ),
      body:Form(
          key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 55.0,top:55.0),
                          child:Text("Tele-Therapy Sign-up" ,style: TextStyle(color: Color(0xff4961AC), fontSize: 25,fontFamily:'Comforta'),textAlign: TextAlign.center,),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("First Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(

                              child: TextFormField(
                                controller: controller.firstName,
                                decoration: InputDecoration(
                                  border: GradientOutlineInputBorder(
                                    width: 2,
                                    gradient: LinearGradient(
                                      colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                 validator: (value){
                                  if(value == null || value.isEmpty){
                                     return 'Please enter first name';
                                   }
                                   return null;
                                 },

                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Last Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(

                              child: TextFormField(
                                controller:controller.lastName,
                                decoration: InputDecoration(
                                  border: GradientOutlineInputBorder(
                                    width: 2,
                                    gradient: LinearGradient(
                                      colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                 validator: (value){
                                   if(value == null || value.isEmpty){
                                     return 'Please enter last name';
                                   }
                                   return null;
                                 },

                              ),
                            ),

                          ],
                        ),
                SizedBox(
                  height: 20,
                ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Email",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                            SizedBox(
                              width: 47,
                            ),
                            Expanded(

                              child: TextFormField(
                                controller: controller.email,
                                decoration: InputDecoration(
                                  border: GradientOutlineInputBorder(
                                    width: 2,
                                    gradient: LinearGradient(
                                      colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                 validator: (value){
                                   if(value == null || value.isEmpty){
                                     return 'Please enter email';
                                   }
                                   else if(!value.contains('@')){
                                     return 'Please enter valid email';
                                   }
                                   return null;
                                 },
                              ),
                            ),

                          ],
                        ),
                SizedBox(
                  height: 20,
                ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Mobile",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(

                              child: TextFormField(
                                controller: controller.password,
                                decoration: InputDecoration(
                                  border: GradientOutlineInputBorder(
                                    width: 2,
                                    gradient: LinearGradient(
                                      colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                 validator: (value){
                                   if(value == null || value.isEmpty){
                                     return 'Please enter mobile number';
                                   }
                                   return null;
                                 },
                              ),
                            ),

                          ],
                        ),



                        Container(
                          width:340,
                          margin: EdgeInsets.only(top: 20.0),
                          child:ElevatedButton(
                            child:Text("Sign-up" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                            onPressed:(){
                              if(_formKey.currentState!.validate()){
                                setState(() {
                                  email=controller.email.text.trim();
                                  password=controller.password.text.trim();
                                  firstname=controller.firstName.text.trim();
                                  lastname=controller.lastName.text.trim();
                                });
                                signupUser();
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
                              primary: Color(0xff4961AC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),

                      ],
                ),


          ),



    );
  }

  void signupUser() async {
    try{
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      addUserData();
      controller.clearFields();
      // String? id = FirebaseAuth.instance.currentUser?.uid;
      // UserModel userModel=UserModel(id:id,firstName: firstname, lastName: lastname, email: email, password: password);
      // db.collection("doctor").doc(password).set(userModel.toJson());
    } on FirebaseAuthException catch (e){
      if(e.code=='email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already in use.")));

      }
        else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Network Issue.")));

      }
    }

  }

  // For adding the new user
  void addUserData() async{
    try{
      String? id = FirebaseAuth.instance.currentUser?.uid;
      UserModel userModel=UserModel(id:id,firstName: firstname, lastName: lastname, email: email, password: password);
      db.collection("User").doc(password).set(userModel.toJson());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered succesfully")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Activity_page3()));
      controller.clearFields();
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Network Issue")));

    }
  }
}




