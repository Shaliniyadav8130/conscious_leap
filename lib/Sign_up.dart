// import 'package:consciousleap/Activity_page3.dart';
// import 'package:consciousleap/Activity_page4.dart';
// import 'package:consciousleap/controllers/signup_controllers.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:gradient_borders/box_borders/gradient_box_border.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:get/get.dart';
// import 'package:consciousleap/models/user_model.dart';
//
// // class SignupView extends StatefulWidget {
// //   @override
// //   _SignupViewState createState() => _SignupViewState();
// // }
//
// class SignupView extends StatelessWidget {
//
//   const SignupView({
//     Key? key,
// }) : super(key:key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//     final _formKey = GlobalKey<FormState>();
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body:Row(
//         key: _formKey,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: 55.0),
//                 child:Text("Tele-Therapy Sign-up" ,style: TextStyle(color: Colors.blueAccent, fontSize: 25,fontFamily:'Comforta'),),
//               ),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("First Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                       width:250,
//                       height:50,
//                       margin: EdgeInsets.only(bottom: 10.0),
//                       decoration: BoxDecoration(
//                           border: const GradientBoxBorder(
//                             gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.circular(12)),
//                     child: TextField(
//                       controller: controller.firstName,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                         hintStyle: TextStyle(color: Colors.black),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                       ),
//                       style: TextStyle(color: Colors.black),
//
//                     ),
//                     ),
//
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Last Name",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     width:250,
//                     height:50,
//                     margin: EdgeInsets.only(bottom: 10.0),
//                     decoration: BoxDecoration(
//                         border: const GradientBoxBorder(
//                           gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: TextField(
//                       controller:controller.lastName,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                         hintStyle: TextStyle(color: Colors.black),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                       ),
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Email",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
//                   SizedBox(
//                     width: 44,
//                   ),
//                   Container(
//                     width:250,
//                     height:50,
//                     margin: EdgeInsets.only(bottom: 10.0),
//                     decoration: BoxDecoration(
//                         border: const GradientBoxBorder(
//                           gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: TextField(
//                       controller: controller.email,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                         hintStyle: TextStyle(color: Colors.black),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                       ),
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Mobile",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
//                   SizedBox(
//                     width: 40,
//                   ),
//                   Container(
//                     width:250,
//                     height: 50,
//                     margin: EdgeInsets.only(bottom: 10.0),
//                     decoration: BoxDecoration(
//                         border: const GradientBoxBorder(
//                           gradient: LinearGradient(colors: [Colors.deepOrange, Colors.blueAccent,Colors.cyanAccent]),
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: TextField(
//                       controller: controller.password,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//
//                         hintStyle: TextStyle(color: Colors.black),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//                       ),
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//
//                 ],
//               ),
//
//
//
//               Container(
//                 width:340,
//                 margin: EdgeInsets.only(top: 20.0),
//                 child:ElevatedButton(
//                    child:Text("Sign-Up" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
//                 onPressed:(){
//                     if(_formKey.currentState!.validate()){
//                      SignUpController.instance.registerUser(controller.email.text.trim(),controller.password.text.trim());
//                    }
//                   // final user = UserModel(
//                   //     firstName:controller.firstName.text.trim(),
//                   //    lastName:controller.lastName.text.trim(),
//                   //    email: controller.email.text.trim(),
//                   //    password: controller.password.text.trim(),
//                   // );
//                   //SignUpController.instance.createUser(user);
//
//                  },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blueAccent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//
//              ],
//            ),
//          ],
//        ),
//     );
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your first name.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your last name.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNoController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your phone number.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _signUp();
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: 'password', // Set your desired password here
      );

      // Store additional user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user.uid)
          .set({
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'email': _emailController.text.trim(),
        'phoneNo': _phoneNoController.text.trim(),
      });

      Fluttertoast.showToast(
        msg: 'Sign up successful!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      // Clear form fields
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _phoneNoController.clear();
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Sign up failed. Please try again later.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
