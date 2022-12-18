// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../page/home.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const HomePage())));
      });
    } catch (e) {
      print("=====> login error $e");
    }
  }

  Future<void> register({
    required String fullname,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await firestore.collection("user").doc(value.user!.uid).set({
          "fullname": fullname,
          "email": email,
          "password": password,
        }).then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => HomePage())));
        });
      });
    } catch (e) {
      print("=====> register error $e");
    }
  }
}
