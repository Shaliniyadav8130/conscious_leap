import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/widgets/CustomInputBorder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TherapistReviewPage extends StatefulWidget {
  final int id;
  const TherapistReviewPage({Key? key, required this.id}) : super(key: key);

  @override
  _TherapistReviewPageState createState() => _TherapistReviewPageState();
}

class _TherapistReviewPageState extends State<TherapistReviewPage> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection("Therapists").snapshots();

  int? _selectedRating;
  int? _selectedRate;
  int? _selectedRates;// Declare the variable to store the selected rating
  final TextEditingController _QuestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            var docs = snapshot.data!.docs;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                  Container(
                  //margin: EdgeInsets.only(top:10),
                  width: 144,
                  height: 144,
                  padding: EdgeInsets.all(2.0),
                  //height: 150,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          Color(0xff4961AC),
                          Color(0xffF2685D),
                          Color(0xff4EC1BA)
                        ]),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(70)
                  ),
                  child:

                  CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(docs[widget.id]["images"]),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                    SizedBox(height: 5),
                    Text(
                      docs[widget.id]["name"],
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Comforta',
                        color: Color(0xff4961AC),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "On a scale of 1 to 5, how would you rate the therapist's ability to create a positive and supportive environment during your sessions?",
                      style: TextStyle(fontSize: 12, fontFamily: "Comforta"),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    // DropdownButtonFormField to show the dropdown
                    DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        hintText: "Select rating",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6D6D6D)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: _selectedRating,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRating = newValue;
                        });
                      },
                      items: [1, 2, 3, 4, 5]
                          .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                          .toList(),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "How knowledgeable and informed did you find the therapist to be about your specific concerns or issues? Please rate their level of expertise on a scale of 1 to 5.",
                      style: TextStyle(fontSize: 12, fontFamily: "Comforta"),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    // DropdownButtonFormField to show the dropdown
                    DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        hintText: "Select rating",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6D6D6D)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: _selectedRate,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRate = newValue;
                        });
                      },
                      items: [1, 2, 3, 4, 5]
                          .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                          .toList(),
                    ),

                    SizedBox(height: 15,),
                    Text(
                      "Did the therapist's calm demeanor and presence contribute to your overall comfort and ability to open up during the sessions? Please share your thoughts on their ability to create a calming atmosphere, using a scale of 1 to 5.",
                      style: TextStyle(fontSize: 12, fontFamily: "Comforta"),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    // DropdownButtonFormField to show the dropdown
                    DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        hintText: "Select rating",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6D6D6D)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: _selectedRates,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRates = newValue;
                        });
                      },
                      items: [1, 2, 3, 4, 5]
                          .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                          .toList(),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _QuestionController,
                      decoration: InputDecoration(
                        hintText: "Additional feedback",
                        hintStyle: TextStyle(
                          fontFamily: 'Comforta', // Use the font family name declared in pubspec.yaml
                          //fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6D6D6D)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                    ),
                    SizedBox(height:15),
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
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => ),
                              // );
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
