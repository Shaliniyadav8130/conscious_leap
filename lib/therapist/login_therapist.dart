import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class login_therapist extends StatefulWidget {
  @override
  State<login_therapist> createState() => _login_therapistState();
}

class _login_therapistState extends State<login_therapist> {
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
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 55.0),
                child:Text("Therapist Login" ,style: TextStyle(color: Color(0xff4961AC), fontSize: 25,fontFamily:'Comforta'),textAlign: TextAlign.center,),
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
                  Text("Mobile",style: TextStyle(color: Colors.black,fontFamily:'Comforta'),),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child:TextFormField(
                      controller: phone,
                      decoration: InputDecoration(

                        border: GradientOutlineInputBorder(
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
                        Phone=phone.text.trim();

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
