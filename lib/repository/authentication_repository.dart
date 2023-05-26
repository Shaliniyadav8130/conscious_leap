import 'package:consciousleap/Activity_page3.dart';
import 'package:consciousleap/Oneness.dart';
import 'package:consciousleap/exceptions/signup_email_password_failure.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();
// Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    // ever(firebaseUser, _setInitialScreen);
  }


     // _setInitialScreen(User? user){
     //   user == null ? Get.offAll(() =>  Oneness()): Get.offAll(() =>  Activity_page3());
     // }

     Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() =>  Activity_page3()): Get.to(() => Oneness());
    }  on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('Firebase Auth Exception - ${ex.message}');
      throw ex;

    } catch (_){
      const ex = SignUpWithEmailAndPasswordFailure();
      print('Exception - ${ex.message}');
      throw ex;
    }
    }
  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }  on FirebaseAuthException catch(e){

    } catch (_){}
  }
  Future<void> login() async => await _auth.signOut();

  }


