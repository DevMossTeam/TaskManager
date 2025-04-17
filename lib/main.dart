import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/app/routes/app_pages.dart';  // pake package-import

void main() {
  runApp(const MyApp());
}

// Definisi MyApp, agar widget_test.dart bisa menemukan kelas ini
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
