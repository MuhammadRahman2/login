import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/scereen/login_page.dart';

// create a function that return user 
Future<User?> createAcount(String name, String email,password)async {
//  To create a new Firebase Auth instance, call the instance getter on FirebaseAuth:
   FirebaseAuth auth = FirebaseAuth.instance;


// that help my app not crash
   try {
    //  create a varibae that help user to store data form firebase
    User? user = (await auth.createUserWithEmailAndPassword(
      email: email, password: password )).user;
      // chech user value null or not null
      if(user != null ){
        print('Account Craate');
        return user;
      }else{
        print('Account Create Faild');
        return user;
      }
   } catch (e) {
     print(e);
   return null;
   }
}
// login funciton for login
Future<User?> logIn(String email,String password) async{

  FirebaseAuth auth =FirebaseAuth.instance;

  try {
    User? user =(await auth.signInWithEmailAndPassword(
      email: email, password: password)).user;
      if (user != null){
        print('Login Succesfully ');
        return user;
      }else{
        print('Login Filled');
        return user;
      }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    await auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch (e) {
    print("error");
  }
}