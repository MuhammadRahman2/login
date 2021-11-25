import 'package:flutter/material.dart';
import 'package:login/method.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            logOut(context);
          },
           child: const Text("LogOut"))
      ),
      
    );
  }
}