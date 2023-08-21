import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consciousleap/Therapist_Dashboard/SessionNotePage.dart';
import 'package:flutter/material.dart';

// Therapist Session Notes

class SessionNotes extends StatefulWidget {

  final String userId; // Add a parameter to receive the user ID

  SessionNotes({required this.userId}); // Constructor to receive the user ID


  @override
  State<SessionNotes> createState() => _SessionNotesState();
}

class _SessionNotesState extends State<SessionNotes> {
  late List<SessionNote> sessionNotes = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    loadSessionNotes();
  }

  void loadSessionNotes() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('session_notes')
        .doc(widget.userId) // Assuming 'userId' is the user's ID
        .collection('notes')
        .get();

    setState(() {
      sessionNotes = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return SessionNote.fromMap(data);
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:Column(
          children: [
            //SizedBox(height: 90,),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Session Notes",style: TextStyle(fontSize: 18,fontFamily: "Comforta",fontWeight: FontWeight.bold),),
                  SizedBox(width: 50,),
                  TextButton(
                    onPressed:(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SessionNotePage(userId: widget.userId)
                          ));
                    },
                    child: Text("New +",style: TextStyle(fontSize: 18,fontFamily: "Comforta",fontWeight: FontWeight.bold),textAlign: TextAlign.right,),)

                ],
              ),
            ),
            //SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left:10,right:10),
              child:ListView.builder(
                shrinkWrap: true,
                itemCount: sessionNotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    // Customize the appearance of each card as per your requirements
                    child: ListTile(
                      title: Text(sessionNotes[index].name), // Display the title of the session note
                      subtitle: Text(sessionNotes[index].age), // Display the description
                      // You can add more details to the ListTile based on your SessionNote model
                    ),
                  );
                },
              ),
            ),

          ],
        ),

      ),
    );
  }
}

class SessionNote {
  final String age;
  final String complaints;
  final String date;
  final String gender;
  final String homework;
  final String name;
  final String occupation;
  final String relationshipStatus;
  final String sessionNumber;
  final String thoughts;
  final Timestamp timestamp;

  SessionNote({
    required this.age,
    required this.complaints,
    required this.date,
    required this.gender,
    required this.homework,
    required this.name,
    required this.occupation,
    required this.relationshipStatus,
    required this.sessionNumber,
    required this.thoughts,
    required this.timestamp,
  });

  // Convert SessionNote object to a map for storing in Firestore
  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'complaints': complaints,
      'date': date,
      'gender': gender,
      'homework': homework,
      'name': name,
      'occupation': occupation,
      'relationshipStatus': relationshipStatus,
      'sessionNumber': sessionNumber,
      'thoughts': thoughts,
      'timestamp': timestamp,
    };
  }

  // Create a SessionNote object from a Firestore document snapshot
  factory SessionNote.fromMap(Map<String, dynamic> map) {
    return SessionNote(
      age: map['age'],
      complaints: map['complaints'],
      date: map['date'],
      gender: map['gender'],
      homework: map['homework'],
      name: map['name'],
      occupation: map['occupation'],
      relationshipStatus: map['relationshipStatus'],
      sessionNumber: map['sessionNumber'],
      thoughts: map['thoughts'],
      timestamp: map['timestamp'],
    );
  }
}
