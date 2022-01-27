import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_form/models/form.dart';
import 'package:getx_form/controllers/form_controller.dart';

class FormScreen extends StatelessWidget {
  static const id = '/Form_Screen';
  final FormController formController = Get.find<FormController>();

  final firstEditingController = TextEditingController();
  final secondEditingController = TextEditingController();

  FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Form Isi Nama'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "First Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: firstEditingController,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Second Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    ),
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: secondEditingController,
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  child: const Text('Simpan'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    formController.forms.add(
                      Efoem(
                        text: firstEditingController.text,
                        second: secondEditingController.text,
                        
                      ),
                    );
                    Get.back();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
