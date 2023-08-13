//Phone Auth

// import 'package:consciousleap/authentication/verification.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:gradient_borders/gradient_borders.dart';
//
// class PhoneAuthentication extends StatefulWidget {
//   static String verify='';
//   @override
//   _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
// }
//
// class _PhoneAuthenticationState extends State<PhoneAuthentication> {
//   final email = TextEditingController();
//   final phone = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String Email="";
//   String Phone="";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //title: Text('Phone Number App'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(padding: EdgeInsets.only(left:20,right:20),
//                 child:IntlPhoneField(
//                   controller: phone,
//                   decoration: InputDecoration(
//                     labelText: 'Phone Number',
//                     counterText: '',
//                     border: GradientOutlineInputBorder(
//                       width: 2,
//                       gradient: LinearGradient(
//                         colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
//                       ),
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   initialCountryCode: 'India',
//                   onChanged: (phone) {
//                     print(phone.completeNumber);
//                   },
//                 ),
//               ),
//               SizedBox(height: 22,),
//               Row(
//                 children: [
//                   Expanded(
//                     child:Padding(
//                       padding: EdgeInsets.only(left:20,right:20),
//                       child:Container(
//                         //width: 200,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             color: Color(0xff4961AC),
//                             borderRadius: BorderRadius.circular(5)),
//                         child: TextButton(
//                           onPressed: (){
//                             SingnInWithOTP();
//
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) =>VerifyCode()
//                                 ));
//                           },
//                           child: Text('Send Code',
//                             style: TextStyle(fontFamily: 'Comforta', color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void SingnInWithOTP() async{
//     try{
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+919456603343',
//         verificationCompleted: (PhoneAuthCredential credential) {},
//         verificationFailed: (FirebaseAuthException e) {},
//         codeSent: (String verificationId, int? resendToken) {
//           PhoneAuthentication.verify=verificationId;
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     }catch(e){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Otp")));
//
//     }
//
//   }
// }
//
//
//
// // Verify code
//
// import 'package:consciousleap/authentication/PhoneAuthentication.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
//
// class VerifyCode extends StatefulWidget {
//   const VerifyCode({Key? key}) : super(key: key);
//
//   @override
//   State<VerifyCode> createState() => _VerifyCodeState();
// }
//
// class _VerifyCodeState extends State<VerifyCode> {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   var otp='';
//
//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(30, 60, 87, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//
//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     );
//
//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );
//
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: Container(
//         margin: EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               SizedBox(
//                 height: 25,
//               ),
//               Text(
//                 "Phone Verification",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: "Comforta"),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//
//               SizedBox(
//                 height: 30,
//               ),
//               Pinput(
//                 length: 6,
//                 // defaultPinTheme: defaultPinTheme,
//                 // focusedPinTheme: focusedPinTheme,
//                 // submittedPinTheme: submittedPinTheme,
//                 onChanged: (value){
//                   otp=value;
//                 },
//                 showCursor: true,
//                 onCompleted: (pin) => {print(pin)},
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: Color(0xff4961AC),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5))),
//                     onPressed: () {
//                       VerifyOTP(otp);
//                     },
//                     child: Text("Verify Phone Number",style: TextStyle(fontFamily: "Comforta",color: Colors.white),)),
//               ),
//               TextButton(
//                   onPressed: () {
//                   },
//                   child: Text(
//                     "Didn't receive code?",
//                     style: TextStyle(color: Colors.black,fontFamily: "Comforta"),
//                   )),
//               TextButton(
//                   onPressed: () {
//                   },
//                   child: Text(
//                     "Resend",
//                     style: TextStyle(color: Color(0xff4961AC),fontFamily: "Comforta"),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void VerifyOTP(String otp) async{
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneAuthentication.verify, smsCode: otp);
//
//     // Sign the user in (or link) with the credential
//     await auth.signInWithCredential(credential);
//     print(credential);
//   }
// }