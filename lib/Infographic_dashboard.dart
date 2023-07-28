import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://consciousleap.co/users/registration');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Successful request
      final data = jsonDecode(response.body);

      setState(() {
        userData = data;
      });
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Data in Flutter'),
        ),
        body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (BuildContext context, int index) {
            final user = userData[index];
            return ListTile(
              title: Text(user['name']),
              subtitle: Text(user['email']),
            );
          },
        ),
      ),
    );
  }
}
