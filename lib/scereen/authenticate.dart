import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/scereen/home_screen.dart';
import 'package:login/scereen/login_page.dart';

class Authenticate extends StatelessWidget {

   FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}