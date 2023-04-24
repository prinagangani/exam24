import 'package:exam24/screens/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  HomeProvider? ht,hf;
  @override
  Widget build(BuildContext context) {
    ht = Provider.of<HomeProvider>(context,listen: true);
    hf = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Api Calling"),
      ),

        ),
    );
  }
}
