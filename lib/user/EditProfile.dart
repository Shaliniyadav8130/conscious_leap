import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/gradient_borders.dart';

// Edit Profile User
class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _nameController.text = user.displayName ?? '';
      _phoneController.text = user.phoneNumber ?? '';
    }
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          await user.updateDisplayName(_nameController.text);

          final userDataRef = FirebaseFirestore.instance
              .collection('User')
              .doc(user.uid);

          Map<String, dynamic> updatedData = {
            'FirstName': _nameController.text,
          };

          if (_phoneController.text.isNotEmpty) {
            updatedData['Phone'] = _phoneController.text;
          }

          await userDataRef.update(updatedData);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile updated successfully')),
          );
        } catch (e) {
          print('Error updating profile: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred while updating profile')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xffF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 45),
            Center(
              child: Text(
                "Manage Profile",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 27, color: Color(0xff4961AC)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: 300,
                      height: 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Basic Info",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff4961AC),
                            ),
                          ),
                          SizedBox(height:10),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: const GradientBoxBorder(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff4961AC),
                                          Color(0xffF2685D),
                                          Color(0xff4EC1BA),
                                        ],
                                      ),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                    AssetImage('assets/images/doctor.jpg'),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                               child: Padding(
                                  padding:EdgeInsets.only(right:20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:150,
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "Upload",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontFamily: 'Comforta',
                                            ),
                                          ),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff4961AC),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width:150,
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontFamily: 'Comforta',
                                            ),
                                          ),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white60,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Padding(padding: EdgeInsets.only(left:15,right:15),
                          child:TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Your Name",
                              hintStyle: TextStyle(
                                fontFamily: 'Comforta',
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff6D6D6D)),
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                            ),
                          ),

                          ),
                          SizedBox(height:10),
                          Padding(padding: EdgeInsets.only(left:15,right:15),
                            child:TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                hintText: "Your Phone",
                                hintStyle: TextStyle(
                                  fontFamily: 'Comforta',
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff6D6D6D)),
                                  borderRadius: BorderRadius.circular(11.0),
                                ),
                              ),
                            ),

                          ),
                          SizedBox(height:10),
                          Padding(padding: EdgeInsets.only(left:15,right:15),
                            child:TextFormField(
                              //controller: _therapistNameController,
                              decoration: InputDecoration(
                                hintText: "Your Password",
                                hintStyle: TextStyle(
                                  fontFamily: 'Comforta',
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff6D6D6D)),
                                  borderRadius: BorderRadius.circular(11.0),
                                ),
                              ),
                            ),

                          ),
                          SizedBox(height:10),
                          Padding(padding: EdgeInsets.only(left:15,right:15),
                            child:TextFormField(
                              //controller: _therapistNameController,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  fontFamily: 'Comforta',
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff6D6D6D)),
                                  borderRadius: BorderRadius.circular(11.0),
                                ),
                              ),
                            ),

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right:20),
                                child:Container(
                                  width:180,
                                  margin: EdgeInsets.only(top: 20.0),
                                  child: ElevatedButton(
                                    child: Text(
                                      "Update Profile",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: 'Comforta',
                                      ),
                                    ),
                                    onPressed: _updateProfile,
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff4961AC),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 17,),
            Row(
              children: [
                Expanded(child:
                Padding(padding: EdgeInsets.only(left:20,right:20),
                child:Container(
                  width: 300,
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child:Column(
                    children: [
                      SizedBox(height:10),
                      Text(
                        "Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff4961AC),
                        ),
                      ),

                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child:Padding(padding: EdgeInsets.only(left:20,right:20,),

                            child: Container(
                              width:200,
                              height:100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xffD9D9D9),
                              ),

                            ),
                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
                ),
              ],
            ),
            SizedBox(height:17),
            Row(
              children: [
                Expanded(child:
                Padding(padding: EdgeInsets.only(left:20,right:20),
                  child:Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child:Column(
                      children: [
                        SizedBox(height:10),
                        Text(
                          "Change Your Email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff4961AC),
                          ),
                        ),
                        SizedBox(height:10),
                        Padding(padding: EdgeInsets.only(left:15,right:15),
                          child:TextFormField(
                            //controller: _therapistNameController,
                            decoration: InputDecoration(
                              hintText: "Your Email",
                              hintStyle: TextStyle(
                                fontFamily: 'Comforta',
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff6D6D6D)),
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                            ),

                          ),

                        ),
                        SizedBox(height:10),
                        Row(
                          children: [
                            Expanded(child:
                            Padding(padding: EdgeInsets.only(left: 10,right: 10),
                              child:Container(
                                width:150,
                                height:50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color:  Colors.black,  // Specify the border color here
                                      width: 1.0,        // Specify the border width here
                                    ),
                                    borderRadius: BorderRadius.circular(10)),

                                margin: EdgeInsets.only(top: 20.0),
                                child: TextButton(
                                  child: Text(
                                    "Verify",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'Comforta',
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),)
                            ),


                            SizedBox(width:20),
                            Expanded(child:
                            Padding(padding: EdgeInsets.only(left: 10,right: 10),
                              child:Container(
                                width:150,
                                height:50,
                                margin: EdgeInsets.only(top: 20.0),
                                child: ElevatedButton(
                                  child: Text(
                                    "Update Email",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontFamily: 'Comforta',
                                    ),
                                  ),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff4961AC),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),)
                            ),


                          ],
                        ),
                        SizedBox(height:10),

                      ],
                    ),
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height:10)
          ],
        ),
      ),
    );
  }
}
