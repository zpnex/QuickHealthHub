import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/views/home_view/Home.dart';
import 'package:qhhub/views/loginView/loginView.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserCredential? userCredential;

  isUserAlreadyLoggedIn() async {
   
   FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.offAll(() => const Home());
      }else{
        Get.offAll(() => const LoginView());
      }
    });
  }

  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  signupUser() async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    if (userCredential != null) {
      await storeUserData(userCredential!.user!.uid, fullnameController.text,
          emailController.text);
    }
  }

  storeUserData(String uid, String fullname, String email) async {
    var store = FirebaseFirestore.instance.collection('user').doc(uid);
    await store.set({
      'fullname': fullname,
      'email': email,
    });
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
  }

  // void isUserAlreadyLoggedIn() {}
}
