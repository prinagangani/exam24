import 'package:exam24/screens/controller/home_controller.dart';
import 'package:exam24/screens/model/home_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? ht,hf;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController txtupname = TextEditingController();
  TextEditingController txtupid = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ht = Provider.of<HomeProvider>(context,listen: true);
    hf = Provider.of<HomeProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.black,
          title: Text("Detail Screen"),centerTitle: true,
        actions: [
          IconButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: txtname,
                        decoration: InputDecoration(hintText: "Enter name",),
                      ),
                      TextField(
                        controller: txtid,
                        decoration: InputDecoration(hintText: "Enter id"),
                      ),SizedBox(height: 10),
                      ElevatedButton(onPressed: () {
                        setState(() {

                        });
                        String name = txtname.text;
                        String id = txtid.text;
                        Modal m1 = Modal(name: name,id: id);
                        hf!.dataList.add(m1);
                        Navigator.pop(context);
                        },child: Text("Add"))
                    ],
                  ),
                );
              },);
            }, icon: Icon(Icons.add)),
          ],
        ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${hf!.dataList[index].id}"),
                        title:  Text("${hf!.dataList[index].name}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: txtupname,
                                          decoration: InputDecoration(hintText: "Enter name"),
                                        ),
                                        TextField(
                                          controller: txtupid,
                                          decoration: InputDecoration(hintText: "Enter id"),
                                        ),
                                        SizedBox(height: 10,),
                                         ElevatedButton(onPressed: () {
                                           setState(() {

                                           });
                                              ht!.dataList[index].name = txtupname.text;
                                              ht!.dataList[index].id = txtupid.text;
                                              Navigator.pop(context);
                                              txtupname.clear();
                                              txtupid.clear();
                                          }, child: Text("Update")),
                                      ],
                                    ),
                                  );
                                },);
                              }, icon: Icon(Icons.edit),),
                             IconButton(onPressed: () {
                               setState(() {

                               });
                                  ht!.dataList.removeAt(index);
                                }, icon: Icon(Icons.delete),),
                          ],
                        ),
                      );
                    },itemCount: ht!.dataList.length,),
              ),
            ],
          ),

        ),
    );
  }
}
