import 'package:consciousleap/user/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TherapistProfile extends StatelessWidget {
  const TherapistProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            SizedBox(
                height:70
            ),
            Container(
              width:150,
              height:150,

              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(150)),

              child:CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/doctor.jpg'),
              ),

            ),
            SizedBox(height:20),
            Padding(padding: EdgeInsets.only(left:20),
              child:Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name: Shalini Yadav",
                  style: TextStyle(fontSize: 13, fontFamily: "Comforta"),
                ),
              ),
            ),

            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.only(left:20),
              child:Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email: shaliniyadav0203@gmail.com",
                  style: TextStyle(fontSize: 13, fontFamily: "Comforta"),
                ),
              ),
            ),
            SizedBox(
                height:20
            ),
            Container(
              width:270,
              height:40,
              decoration: BoxDecoration(
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(colors: [Color(0xff4961AC), Color(0xffF2685D),Color(0xff4EC1BA)]),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(25)),

              child:TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent), // Set overlay color to transparent to remove the ripple effect
                ),
                child: Text("Edit Profile",style: TextStyle(fontSize:15,color: Color(0xff4961AC),fontFamily:'Comforta'),),
                onPressed:(){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>EditProfile()
                      ));
                },
              ),


            ),
          ],
        )
    );
  }
}
