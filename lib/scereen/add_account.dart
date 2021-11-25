import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/method.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading? Center(
        child: Container(
          height: size.height/20,
          width: size.width/ 30 ,
          child: const CircularProgressIndicator()
      ),)
      :SingleChildScrollView(
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
              "Create Account to Contiue!",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "Name", Icons.account_box,_name),
            ),
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
              child: field(size,"password",Icons.lock,_password),
            ),
          ),
          SizedBox(
            height: size.height / 10,
          ),
          customButton(size),
          SizedBox(
            height: size.height / 70,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);  
            },
            child: const Text("Login",style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500
              ),),
          )
        ]),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: (){
        // check the name,eamil is not empty 
        if(_name.text.isNotEmpty &&
         _email.text.isNotEmpty &&
         _password.text.isNotEmpty
         ){
           setState(() {
             isLoading =true;
           });
           createAcount(_name.text,_email.text,_password.text)
           .then((value){
             if (value != null) {
               setState(() {
                 isLoading = false;
               });
               print('Account Create Seccesfully');
             } else {
               print('login faild');
             }
           });
         }else{
           print('Plese Enter Your fields');
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
          child: const Text(
            "Create Account",
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
