import 'package:exam24/screens/controller/home_controller.dart';
import 'package:exam24/screens/view/detail_screen/view/detail_screen.dart';
import 'package:exam24/screens/view/sign_in/view/sign_in.dart';
import 'package:exam24/screens/view/sign_up/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: 'detail',
        routes: {
          '/':(p0) => SignInScreen(),
          'signup':(p0) => SignUpScreen(),
          'detail':(p0) => DetailScreen(),
        },
      ),
    ),
  );
}