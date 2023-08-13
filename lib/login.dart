import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Questionnarie/Analysis_Report.dart';
import 'package:consciousleap/Questionnarie/questionnarie.dart';
import 'package:consciousleap/models/UserModel.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/user/UserDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  static String verify='';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final controller = Get.put(SignUpController());
  final email = TextEditingController();
  final phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String Email="";
  String Phone="";
  FirebaseAuth auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body:Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.only(left:16.0,right:16),
            children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child:Text("Therapy Login" ,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff4961AC), fontSize: 25,fontFamily:'Comforta'),textAlign: TextAlign.center,),
                  ),

                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Expanded(
                        child: TextFormField(
                          controller: email,
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your email';
                             }
                             return null;
                           },
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                         Expanded(
                           child:TextFormField(
                          controller: phone,
                           decoration: InputDecoration(
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
                               borderRadius: BorderRadius.circular(8.0),
                             ),

                           ),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Please enter your password';
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
                      child:Text("Login" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            Email=email.text.trim();
                            Phone=phone.text.trim();

                          });
                          // signinUser();
                          SingnInWithOTP();
                        }
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
        )

    );
  }
  void signinUser() async {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(""+Phone+Email)));

    try{
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email:Email, password:Phone);

      print(userCredential);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login succesfully")));
      // UserModel user = UserModel(
      //   id: userCredential.user!.uid,
      //   firstName: "", // Populate with actual data
      //   lastName: "",  // Populate with actual data
      //   email: Email,
      //   password: Phone,
      //   phone: Phone,
      // );
      //Navigator.push(context, MaterialPageRoute(builder: (context) => UserDashboard(user: user)));//controller.email.clear();
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('User').doc(userCredential.user!.uid).get();
      if (userSnapshot.exists) {
        // Get the data and navigate to the dashboard
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserDashboard(userData: userData),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User data not found.")));
      }

      //controller.password.clear();
      // String? id = FirebaseAuth.instance.currentUser?.uid;
      // UserModel userModel=UserModel(id:id,firstName: firstname, lastName: lastname, email: email, password: password);
      // db.collection("doctor").doc(password).set(userModel.toJson());
    } on FirebaseAuthException catch (e){
      if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password.")));

      }else if(e.code=='invalid-email'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email.")));

      }
      else if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("" + e.code.toString())));

      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Network Issue.")));

      }
    }
  }

  void SingnInWithOTP() async{
      await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+919084000392',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        LoginScreen.verify=verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // void VerifyOTP() async{
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: LoginScreen.verify, smsCode: smsCode);
  //
  //   // Sign the user in (or link) with the credential
  //   await auth.signInWithCredential(credential);
  // }
}
