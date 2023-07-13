import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Questionnarie/Analysis_Report.dart';
import 'package:consciousleap/Questionnarie/questionnarie.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  //final controller = Get.put(SignUpController());
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String Email="";
  String Password="";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body:Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 55.0),
                    child:Text("Tele-Therapy Login" ,style: TextStyle(color: Color(0xff4961AC), fontSize: 25,fontFamily:'Comforta'),textAlign: TextAlign.center,),
                  ),

                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Email",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                      SizedBox(
                        width: 22,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
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
                      Text("Password",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                      SizedBox(
                        width: 18,
                      ),
                         Expanded(
                           child:TextFormField(
                          controller: password,
                           decoration: InputDecoration(

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
                               return 'Please enter your mobile';
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
                            Password=password.text.trim();

                          });
                          signinUser();
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
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email:Email, password:Password);
      print(userCredential);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login succesfully")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Analysis_Report()));
      //controller.email.clear();
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

}
