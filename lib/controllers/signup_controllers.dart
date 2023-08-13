import 'package:consciousleap/models/UserModel.dart';
import 'package:consciousleap/repository/authentication_repository.dart';
import 'package:consciousleap/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone=TextEditingController();
  final reTypePassword=TextEditingController();
  bool acceptTerms = false;

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async{
    await userRepo.createUser(user);
  }

  void clearFields() {
    firstName.clear();
    lastName.clear();
    email.clear();
    password.clear();
    phone.clear();
    reTypePassword.clear();

  }

}