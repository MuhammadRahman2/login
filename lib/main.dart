import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/scereen/authenticate.dart';
import 'package:login/scereen/home_screen.dart';
import 'package:login/scereen/login_page.dart';

Future main(List<String> args) async {
  // initilize for firebase
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: LoginScreen(),
    );
  }
}

