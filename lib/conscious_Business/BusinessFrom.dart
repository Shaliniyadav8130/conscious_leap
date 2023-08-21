import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/therapist/Thankyou.dart';
import 'package:flutter/material.dart';

// Signup Page for a new User
class BusinessForm extends StatefulWidget {
  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _PhoneController = TextEditingController();
  final TextEditingController _CompanyController = TextEditingController();
  final TextEditingController _EmployeesController = TextEditingController();
  final TextEditingController _IndustryController = TextEditingController();
  final TextEditingController _CountryController = TextEditingController();
  final TextEditingController _HearController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // SizedBox(height: 80,),
                Center(
                  child: Text("Schedule a Call", style: TextStyle(fontSize: 25, fontFamily: "Comforta", color: Color(0xff4961AC)),textAlign: TextAlign.center,),
                ),

                SizedBox(height: 25),
                //Text("Client's Info", style: TextStyle(fontSize: 25, fontFamily: "Comforta", color: Colors.black)),
                //SizedBox(height: 15),
                Text("Name ", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _NameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                      //fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Text("Phone no", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _PhoneController,
                  decoration: InputDecoration(
                    hintText: "Phone No.",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                      //fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone No.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Company Name", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _CompanyController,
                  decoration: InputDecoration(
                    hintText: "Company Name",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                      //fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Company Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("No. of Employees", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _EmployeesController,
                  decoration: InputDecoration(
                    hintText: "No. of Employees",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                      //fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter No. of employees';
                    }
                    return null;
                  },
                ),
                                SizedBox(height: 20),
                Text("Industry", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _IndustryController,
                  decoration: InputDecoration(
                    hintText: "Industry",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                      //fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Industry';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                Text("Country", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _CountryController,
                  decoration: InputDecoration(
                    hintText: "Country",
                    hintStyle: TextStyle(
                      fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                      //fontSize: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Country';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("How did you hear about us?", style: TextStyle(fontSize: 20, fontFamily: "Comforta", color: Colors.black)),
                SizedBox(height: 10),
                TextFormField(
                  controller: _HearController,
                  maxLength: 200,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff6D6D6D)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 161,
                    height: 41,
                    margin: EdgeInsets.only(bottom: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff4961AC),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 17, color: Colors.white, fontFamily: 'Comforta'),
                      ),
                      onPressed: () async {
                        try {
                          final CollectionReference businessFormsCollection = FirebaseFirestore.instance.collection('ScheduleCall');

                          await businessFormsCollection.add({
                            'name': _NameController.text,
                            'phoneNo': _PhoneController.text,
                            'companyName': _CompanyController.text,
                            'noOfEmployees': _EmployeesController.text,
                            'industry': _IndustryController.text,
                            'country': _CountryController.text,
                            'howDidYouHear': _HearController.text,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Form submitted successfully.")));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Thankyou()), // Replace 'YourNextScreen()' with the desired screen
                          );
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error submitting form.")));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
