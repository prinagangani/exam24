import 'package:exam24/screens/model/home_modal.dart';
import 'package:exam24/screens/providerr/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  // @override
  // void initState() {
  //   Provider.of<HomeProvider>(context,listen: false).call();
  //   super.initState();
  // }
  HomeProvider? ht,hf;
  @override
  Widget build(BuildContext context) {
    ht = Provider.of<HomeProvider>(context,listen: true);
    hf = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Api Calling"),
      ),
        body: FutureBuilder(
          future: hf!.call(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                print(snapshot.error);
              }
            else if(snapshot.hasData)
              {
                CountryModal? c1 = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(border: Border.all(width: 0.5,color: Colors.black)),
                    child: ListTile(
                      leading: Text("${c1!.countriesStat[index].countryName}"),
                      title: Text("Death : ${c1!.countriesStat[index].deaths}"),
                      subtitle: Text("Active cases${c1!.countriesStat[index].cases}"),
                    ),
                  );
                },itemCount: c1!.countriesStat.length,);
              }
            return Center(child: CircularProgressIndicator());
          },
        ),
        ),
    );
  }
}
