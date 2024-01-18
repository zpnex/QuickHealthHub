import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:qhhub/consts/consts.dart';
import 'package:qhhub/views/appointment_view/AppointmentView.dart';
import 'package:qhhub/views/home_view/Home.dart';
import 'package:qhhub/views/loginView/loginView.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var categoryController = TextEditingController();
  var sevicesController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var timingController = TextEditingController();
  var aboutController = TextEditingController();
  
  UserCredential? userCredential;

  isUserAlreadyLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        var data = await FirebaseFirestore.instance
            .collection('doctors')
            .doc(user.uid)
            .get();
        var isDoc = data.data()?.containsKey('docName') ?? false;

        if (isDoc) {
          Get.offAll(() => const AppointmentView());
        } else {
          Get.offAll(() => const Home());
        }
      } else {
        Get.offAll(() => const LoginView());
      }
    });
  }

  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  signupUser(bool isDoctor) async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    if (userCredential != null) {
      await storeUserData(userCredential!.user!.uid, fullnameController.text,
          emailController.text, isDoctor);
    }
  }

  storeUserData(
      String uid, String fullname, String email, bool isDoctor) async {
    var store = FirebaseFirestore.instance.collection('user').doc(uid);
    if (isDoctor) {
      await store.set({});
    }
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
