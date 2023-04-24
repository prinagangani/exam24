import 'package:exam24/screens/controller/home_controller.dart';
import 'package:exam24/screens/view/sign_in/view/sign_in.dart';
import 'package:exam24/utils/share_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  HomeProvider? ht,hf;
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)!.settings.arguments as int;
    ht = Provider.of<HomeProvider>(context,listen: true);
    hf = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Sign Up"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtemail,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.email),focusedBorder: OutlineInputBorder(),enabledBorder: OutlineInputBorder(),hintText: "Enter your email",),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtpass,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.lock_open_sharp),focusedBorder: OutlineInputBorder(),enabledBorder: OutlineInputBorder(),hintText: "Enter your password",),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.black),onPressed: () async {
                var email = txtemail.text;
                var pass = txtpass.text;
                Share shr = Share();
                shr.create(email, pass, false);
                Navigator.pop(context);
                }, child: Text("Register")),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have account ?",style: TextStyle(letterSpacing: 1,fontWeight: FontWeight.bold),),
                  TextButton(onPressed: () {
                  }, child: Text("Sign In",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
