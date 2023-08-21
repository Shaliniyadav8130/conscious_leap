import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/controllers/signup_controllers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:consciousleap/models/UserModel.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
  String phone="";
  var db = FirebaseFirestore.instance;
  String password = "";
  var isObsecure = true.obs;
  var confirmObsecure = true.obs;

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
       appBar: AppBar(
       ),
      body:Form(
          key: _formKey,
            child: ListView(
              padding: EdgeInsets.only(left:16,right:16),
              children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 50.0),
                          child:Text("Therapy Sign-up" ,style: TextStyle(fontWeight:FontWeight.bold ,color: Color(0xff4961AC), fontSize: 25,fontFamily:'Comforta'),textAlign: TextAlign.center,),
                        ),

                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(
                              child:Padding(
                                padding:EdgeInsets.only(left:15,right:15),
                                          child: TextFormField(
                                          controller: controller.firstName,
                                          decoration: InputDecoration(
                                            hintText: "Name",
                                            hintStyle: TextStyle(
                                              fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                                              fontSize: 16.0,
                                            ),
                                            contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0, // Adjust the vertical padding
                                              horizontal: 16.0, // Adjust the horizontal padding
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

                              child:Padding(
                                padding: EdgeInsets.only(left:15,right:15),
                                child: TextFormField(
                                  controller: controller.email,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                                      fontSize: 16.0,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, // Adjust the vertical padding
                                      horizontal: 16.0, // Adjust the horizontal padding
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
                              child:Padding(
                                padding: EdgeInsets.only(left:15,right:15),
                                child: TextFormField(
                                  controller: controller.phone,
                                  decoration: InputDecoration(
                                    hintText: "Mobile",
                                    hintStyle: TextStyle(
                                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                                      fontSize: 16.0,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.0, // Adjust the vertical padding
                                      horizontal: 16.0, // Adjust the horizontal padding
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

                      child:Padding(
                        padding: EdgeInsets.only(left:15,right:15),
                        child:Obx( ()=>TextFormField(
                          //obscureText: true,
                          obscureText: isObsecure.value,
                          controller:controller.password,
                          decoration: InputDecoration(
                            suffixIcon: Obx(
                                  ()=>GestureDetector(
                                onTap: (){
                                  isObsecure.value = !isObsecure.value;
                                },
                                child: Icon(
                                  isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                              fontSize: 16.0,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, // Adjust the vertical padding
                              horizontal: 16.0, // Adjust the horizontal padding
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
                    child:Padding(
                      padding: EdgeInsets.only(left:15,right:15),
                      child:Obx( ()=>TextFormField(

                        obscureText: confirmObsecure.value,
                        controller: controller.reTypePassword,
                        decoration: InputDecoration(
                          suffixIcon: Obx(
                                ()=>GestureDetector(
                              onTap: (){
                                confirmObsecure.value = !confirmObsecure.value;
                              },
                              child: Icon(
                                confirmObsecure.value ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                            fontSize: 16.0,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, // Adjust the vertical padding
                            horizontal: 16.0, // Adjust the horizontal padding
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
                    ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: controller.acceptTerms, // Use a boolean variable to track the checkbox state
                      onChanged: (newValue) {
                        setState(() {
                          controller.acceptTerms = newValue ?? false;
                        });
                      },
                    ),
                    Text(
                      "I accept the terms and conditions",
                      style: TextStyle(fontFamily: 'Comforta', fontSize: 14.0),
                    ),
                  ],
                ),


                Row(
                  children: [
                    Expanded(
                      child:Padding(
                        padding: EdgeInsets.only(left:15,right:15),
                        child:Container(
                          width:200,
                          margin: EdgeInsets.only(top: 20.0),
                          child:ElevatedButton(
                            child: Text("Sign-up", style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: 'Comforta')),
                            onPressed: controller.acceptTerms
                                ? () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  email = controller.email.text.trim();
                                  password = controller.reTypePassword.text.trim();
                                  firstname = controller.firstName.text.trim();
                                  phone = controller.phone.text.trim();
                                });
                                signupUser();
                              }
                            }
                                : null, // Disable the button if terms are not accepted
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff4961AC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),

                        ),


                      ),
                    ),
                  ],
                ),
                      ],
                ),


          ),



    );
  }

  void signupUser() async {
    if (!controller.acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please accept the terms and conditions.")));
      return;
    }

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
      UserModel userModel=UserModel(id:id,firstName: firstname, lastName: "lastname", email: email, password: password,phone: phone,hasAcceptedTerms: controller.acceptTerms,);
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

