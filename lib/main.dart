import 'dart:async';
import 'package:consciousleap/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


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
      home: SplashScreen(),
    );
  }
}
//  class MyHomePage extends StatefulWidget {
//    @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

//class _MyHomePageState extends State<MyHomePage> {
  // @override
  //   void initState() {
  //     //TODO: implement initState
  //     super.initState();
  //     Timer(Duration(seconds: 5),(){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Oneness(),
  //       ));
  //     });
  //  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //         width: double.infinity,
  //         height: double.infinity,
  //         child:const Image(image: AssetImage("assets/images/App splash.gif"),),
  //         );

      //This trailing comma makes auto-formatting nicer for build methods.

 // }
//}
