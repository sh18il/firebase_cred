import 'package:ffff/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:random_string/random_string.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController addresCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("name")),
              ),
              Gap(15),
              TextFormField(
                controller: addresCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("address")),
              ),
              Gap(15),
              TextFormField(
                controller: phoneCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone")),
              ),
              Gap(15),
              ElevatedButton(
                  onPressed: () async {
                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> detals = {
                      "name": nameCtrl.text,
                      "address": addresCtrl.text,
                      "phone": phoneCtrl.text,
                      "id": id,
                    };
                    await DatabaseMethod()
                        .addDetails(detals, id)
                        .then((value) => {
                              Fluttertoast.showToast(
                                  msg: "adding sucssuss",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0)
                            });
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
