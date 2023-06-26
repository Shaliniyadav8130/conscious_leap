import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:consciousleap/SplashScreen.dart';
import 'package:consciousleap/conscious_store/Conscious_Categories.dart';
import 'package:consciousleap/login.dart';
import 'package:consciousleap/therapist/login_therapist.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:consciousleap/Activity_page21.dart';
import 'package:consciousleap/Oneness.dart';
import 'package:consciousleap/Sign_up.dart';
import 'package:consciousleap/conscious_store/conscious_login.dart';
import 'package:consciousleap/repository/authentication_repository.dart';
import 'package:consciousleap/therapist/Therapist_List.dart';
import 'package:consciousleap/therapist/doctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';


void main () async{

  WidgetsFlutterBinding.ensureInitialized();
  //Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  //await Firebase.initializeApp();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

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
      title: 'consciousleap',
      theme: ThemeData
         (
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
         useMaterial3: true,
       ),
      home: MyHomePage(),
    );
  }
}
 class MyHomePage extends StatefulWidget {
   @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
    void initState() {
      //TODO: implement initState
      super.initState();
      Timer(Duration(seconds: 5),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Oneness(),
        ));
      });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
       body: Center(
        child: Container(

          child:const Image(image: AssetImage("assets/images/App splash.gif"),),
          ),
        ),

      //This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
