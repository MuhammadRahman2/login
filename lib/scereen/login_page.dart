import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/method.dart';
import 'package:login/scereen/add_account.dart';
import 'package:login/scereen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
        child: Column(children: [
        SizedBox(
          height: size.height / 20,
        ),
        Container(
            alignment: Alignment.center,
            width: size.width / 1.2,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {},
            )),
        SizedBox(height: size.height / 50),
        Container(
          width: size.width / 1.3,
          child: const Text(
            "welcome",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: size.width / 1.1,
          child: Text(
            "Sign In to Contiue!",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: size.height / 10,
        ),
        Container(
          width: size.width,
          alignment: Alignment.center,
          child: field(size, "email", Icons.account_box, _email),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Container(
            width: size.width,
            alignment: Alignment.center,
            child: field(size, "password", Icons.lock,_password),
          ),
        ),
        SizedBox(
          height: size.height / 10,
        ),
        customButton(size),
        SizedBox(
          height: size.height/40
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (contex) => CreateAccount()
              ));
          },
          child: const Text('Create Account',style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),),
        )

      ]),
    )
    );
    
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: (){
        if (_email.text.isNotEmpty && _password.text.isNotEmpty){
          setState(() {
            isLoading = true;
          });
          logIn(_email.text, _password.text)
          .then((value){
            if (value != null){
              setState(() {
                isLoading = false;
              });
              Navigator.push(context,MaterialPageRoute(
                builder: (context)=>HomeScreen()
                ));
            }else{
              print('Login failed'); 
            }
          } );
        }else{
          print('plz fill the fields');
        }
      },
      child: Container(
            height: size.height / 14,
            width: size.width / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child:const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
    );
  }

  Widget field(Size size, String hintText, IconData icon,TextEditingController controller) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.2,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
