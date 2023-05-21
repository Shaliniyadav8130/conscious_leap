import 'dart:async';

import 'package:consciousleap/Activity_page1.dart';
import 'package:consciousleap/Activity_page2.dart';
import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Activity_page4.dart';
import 'package:consciousleap/Activity_page5.dart';
import 'package:consciousleap/Oneness.dart';
import 'package:consciousleap/Sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Sign_up(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(Duration(seconds:4),(){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Oneness(),
  //     ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Image.asset('assets/images/splash.png'),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
