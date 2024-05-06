import 'package:ffff/service/database.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditScreen extends StatefulWidget {
  String name;
  String addres;
  String phone;
  String id;

  EditScreen(
      {super.key,
      required this.name,
      required this.addres,
      required this.phone,
      required this.id});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController(text: widget.name);
    TextEditingController addresCtrl =
        TextEditingController(text: widget.addres);
    TextEditingController phoneCtrl = TextEditingController(text: widget.phone);
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  Map<String, dynamic> updateInfo = {
                    "name": nameCtrl.text,
                    "address": addresCtrl.text,
                    "phone": phoneCtrl.text,
                    "id": widget.id,
                  };
                  await DatabaseMethod().updateData(widget.id, updateInfo);
                },
                child: Text("submit")),
          ],
        ),
      ),
    );
  }
}
