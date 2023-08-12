
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Questionnarie/Activity_page4.dart';
import 'package:consciousleap/controllers/signup_controllers.dart';
import 'package:consciousleap/customWidgets/CustomInput.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:consciousleap/models/UserModel.dart';
import 'package:gradient_borders/gradient_borders.dart';

// Signup Page for a new User
class ConsciousSignup extends StatefulWidget {

  const ConsciousSignup({
    Key? key,
  }) : super(key:key);

  @override
  State<ConsciousSignup> createState() => _ConsciousSignupState();
}

class _ConsciousSignupState extends State<ConsciousSignup> {
  final controller = Get.put(SignUpController());
  String email = "";
  String firstname = "";
  String lastname = "";
  String phone="";
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
              child:Text("Conscious Store Sign-up" ,style: TextStyle(fontWeight:FontWeight.bold ,color: Color(0xff4961AC), fontSize: 25,fontFamily:'Comforta'),textAlign: TextAlign.center,),
            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(

                  child: TextFormField(
                    controller: controller.firstName,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(
                        fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                        fontSize: 16.0,
                      ),
                      border: GradientOutlineInputBorder(
                        width: 2,
                        gradient: LinearGradient(
                          colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter name';
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text("Last Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //
            //       child:
            //       TextFormField(
            //         controller:controller.lastName,
            //         decoration: InputDecoration(
            //           border: GradientOutlineInputBorder(
            //             width: 2,
            //             gradient: LinearGradient(
            //               colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
            //             ),
            //             borderRadius: BorderRadius.circular(8.0),
            //           ),
            //         ),
            //          validator: (value){
            //            if(value == null || value.isEmpty){
            //              return 'Please enter last name';
            //            }
            //            return null;
            //          },
            //
            //       ),
            //     ),
            //
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(

                  child:
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                        fontSize: 16.0,
                      ),
                      border: GradientOutlineInputBorder(
                        width: 2,
                        gradient: LinearGradient(
                          colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                        ),
                        borderRadius: BorderRadius.circular(5.0),
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
                Expanded(

                  child: TextFormField(
                    controller: controller.phone,
                    decoration: InputDecoration(
                      hintText: "Mobile",
                      hintStyle: TextStyle(
                        fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                        fontSize: 16.0,
                      ),
                      border: GradientOutlineInputBorder(
                        width: 2,
                        gradient: LinearGradient(
                          colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                        ),
                        borderRadius: BorderRadius.circular(5.0),
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(

                  child:
                  TextFormField(
                    obscureText: true,
                    controller:controller.password,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                        fontSize: 16.0,
                      ),
                      border: GradientOutlineInputBorder(
                        width: 2,
                        gradient: LinearGradient(
                          colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value){
                      password=value!;
                      if(value == null || value.isEmpty){
                        return 'Please enter password';
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

                Expanded(
                  child:
                  TextFormField(

                    obscureText: true,
                    controller: controller.reTypePassword,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                        fontSize: 16.0,
                      ),
                      border: GradientOutlineInputBorder(
                        width: 2,
                        gradient: LinearGradient(
                          colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter password';
                      }
                      else if(value!=password){
                        return 'Please enter same password \n $password value $value';
                      }
                      return null;
                    },
                  ),
                ),

              ],
            ),


            Container(
              width:200,
              margin: EdgeInsets.only(top: 20.0),
              child:ElevatedButton(
                child:Text("Sign-up" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                onPressed:(){
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      email=controller.email.text.trim();
                      password=controller.reTypePassword.text.trim();
                      firstname=controller.firstName.text.trim();
                      phone=controller.phone.text.trim();
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
      //String? id = FirebaseAuth.instance.currentUser?.uid;
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
      UserModel userModel=UserModel(id:id,firstName: firstname, lastName: "lastname", email: email, password: password,phone: phone);
      db.collection("User").doc(id).set(userModel.toJson());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered succesfully")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Activity_page3()));
      controller.clearFields();
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Network Issue")));

    }
  }
}

