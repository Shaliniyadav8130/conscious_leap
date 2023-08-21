import 'package:consciousleap/user/UserDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

// Business Login

class businessLogin extends StatefulWidget {
  @override
  State<businessLogin> createState() => _businessLoginState();
}

class _businessLoginState extends State<businessLogin> {
  //final controller = Get.put(SignUpController());
  final email = TextEditingController();
  final phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String Email="";
  String Phone="";
  FirebaseAuth auth = FirebaseAuth.instance;
  var isObsecure = true.obs;
  bool acceptTerms = false;


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
                child:Text("Business Login" ,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff4961AC), fontSize: 25,fontFamily:'Comforta'),textAlign: TextAlign.center,),
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left:15,right:15),
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
                  ),
                ],
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left:15,right:15),
                      child:Obx( ()=>TextFormField(
                        obscureText: isObsecure.value,
                        controller: phone,
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
                    ),
                  ),
                ],
              ),


              Row(
                children: [
                  Expanded(
                    child:Padding(
                      padding:EdgeInsets.only(left:15,right:15),

                      child: Container(
                        width:340,
                        margin: EdgeInsets.only(top: 20.0),
                        child:ElevatedButton(
                          child:Text("Login" ,style:TextStyle(fontSize:15,color: Colors.white,fontFamily:'Comforta')),
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
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('User').doc(userCredential.user!.uid).get();
      if (userSnapshot.exists) {
        // Get the data and navigate to the dashboard
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserDashboard(userData: userData,user: userCredential.user,),
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

}
