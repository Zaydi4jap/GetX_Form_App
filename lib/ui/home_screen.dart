import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_form/main.dart';
import 'package:getx_form/controllers/form_controller.dart';
import 'package:getx_form/ui/form_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final FormController formController = Get.put(FormController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed(FormScreen.id);
        },
      ),
      body: Obx(
        () => ListView.separated(
          separatorBuilder: (context, index) {
          return const Divider(
               color: Colors.grey,
             );
            },
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.grey,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (_) {
              formController.forms.removeAt(index);
              Get.snackbar('Remove!', "Nama berhasil di Hapus",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: ListTile(
              title: Text(
                formController.forms[index].text!,
                style: const TextStyle(
                      color: Colors.black,
                      ),
              ),
              subtitle: Text(
                formController.forms[index].second!,
                style: const TextStyle(
                      color: Colors.black,
                      ),
              ),
            ),
          ),
          itemCount: formController.forms.length,
        ),
      ),
    );
  }
}
