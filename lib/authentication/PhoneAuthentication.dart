import 'package:consciousleap/authentication/verification.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:gradient_borders/gradient_borders.dart';

class PhoneAuthentication extends StatefulWidget {
  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Phone Number App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left:20,right:20),
            child:IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                counterText: '',
                border: GradientOutlineInputBorder(
                  width: 2,
                  gradient: LinearGradient(
                    colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)],  // Replace with your desired gradient colors
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              initialCountryCode: 'India',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            ),
            SizedBox(height: 22,),
            Row(
              children: [
            Expanded(
            child:Padding(
            padding: EdgeInsets.only(left:20,right:20),
              child:Container(
                //width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff4961AC),
                    borderRadius: BorderRadius.circular(5)),
                     child: TextButton(
                       onPressed: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) =>VerifyCode()
                             ));
                       },
                          child: Text('Send Code',
                            style: TextStyle(fontFamily: 'Comforta', color: Colors.white),
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
}
