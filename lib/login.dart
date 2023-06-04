import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final email = TextEditingController();
  final phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String Email="";
  String Phone="";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body:Form(
        key: _formKey,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 55.0),
                child:Text("Tele-Therapy Login" ,style: TextStyle(color: Colors.blueAccent, fontSize: 25,fontFamily:'Comforta'),),
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
                      controller: email,
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
                      controller: phone,
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
                  child:Text("Login" ,style:TextStyle(fontSize:12,color: Colors.white,fontFamily:'Comforta')),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        Email=email.text.trim();
                        Phone=phone.text.trim();
                        
                      });
                      signinUser();
                    }
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
      )

    );
  }
  void signinUser() async {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(""+Phone+Email)));

    try{
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email:Email, password:Phone);
      print(userCredential);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login succesfully")));

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

