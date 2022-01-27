import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:getx_form/ui/home_screen.dart';
import 'package:getx_form/ui/form_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'List Nama';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      getPages: [
        GetPage(name: FormScreen.id, page: () => FormScreen()),
        GetPage(name: HomeScreen.id, page: () => HomeScreen()),
      ],
    );
  }
}
