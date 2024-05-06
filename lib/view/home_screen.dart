import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffff/service/database.dart';
import 'package:ffff/view/add_screen.dart';
import 'package:ffff/view/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? detailsStream;

  getontheload() async {
    detailsStream = await DatabaseMethod().getDetails();

    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allDetails() {
    return StreamBuilder(
      stream: detailsStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Name:" + ds["name"],
                                style: TextStyle(color: Colors.blue),
                              ),
                              Gap(10),
                              Text(
                                "address:" + ds["address"],
                                style: TextStyle(color: Colors.blue),
                              ),
                              Gap(10),
                              Text(
                                "Phone:" + ds["phone"],
                                style: TextStyle(color: Colors.blue),
                              ),
                              Gap(10),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                    name: ds["name"],
                                    addres: ds["address"],
                                    phone: ds["phone"],
                                    id: ds["id"],
                                  ),
                                ));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () async {
                                await DatabaseMethod().deleteData(ds["id"]);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("FireBase "),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddScreen(),
          ));
        }),
        body: Column(
          children: [
            Expanded(child: allDetails()),
          ],
        ),
      ),
    );
  }
}
