import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/user/TherapistReviewPage.dart';
import 'package:consciousleap/widgets/CustomInputBorder.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// Therapist Review Widget

class TherapistReview extends StatefulWidget {
  @override
  _TherapistReviewState createState() => _TherapistReviewState();
}

class _TherapistReviewState extends State<TherapistReview> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection("Therapists").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0), // Add left and right padding of 10 pixels
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            var docs = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two therapists per row
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 24.0,
              ),
              itemCount: docs.length,
              itemBuilder: (context, index) {

                  return Padding(
                  padding: EdgeInsets.only(bottom:5),
                  child:
                  InkWell(
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) =>
                             TherapistReviewPage(id: index)
                         ));
                   },

                child:
                  Column(
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
                      radius: 55,
                      backgroundImage: NetworkImage(docs[index]["images"]),
                      backgroundColor: Colors.transparent,
                    ),
                    ),
                    SizedBox(height: 5),
                      Padding(
                          padding: EdgeInsets.only(bottom:7),
                          child: Text(
                            docs[index]["name"],
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Comforta',
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ),



                  ],
                  ),
                  )

                );
              },
            );
          },
        ),
      ),
    );
  }
}
