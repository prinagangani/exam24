import 'package:exam24/screens/controller/home_controller.dart';
import 'package:exam24/screens/view/detail_screen/view/detail_screen.dart';
import 'package:exam24/screens/view/sign_up/view/sign_up.dart';
import 'package:exam24/utils/share_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  HomeProvider? ht,hf;
  int index = 0;
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ht = Provider.of<HomeProvider>(context,listen: true);
    hf = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan,
         appBar: AppBar(
           backgroundColor: Colors.black,
        title: Text("Sign In"),centerTitle: true,
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
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black),onPressed: () async {
                    String useremail = txtemail.text;
                    String userpass = txtpass.text;
                    Share shr = Share();
                    Map m1 = await shr.read();
                    if(useremail==m1['e'] && userpass==m1['p'])
                      {
                        shr.create(txtemail.text, txtpass.text,true);
                        Navigator.pushNamed(context, 'detail',arguments: index);
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Id or Password")),);
                      }
                }, child: Text("Login")),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ?",style: TextStyle(
                        letterSpacing: 1, fontWeight: FontWeight.bold),),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context, 'signup',arguments: index);
                    }, child: Text("Sign Up",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),),),],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
