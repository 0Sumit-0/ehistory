import 'package:ehistory/myscreens.dart';
import 'package:ehistory/screens/homepage.dart';
import 'package:ehistory/screens/playingpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ehistory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Navigate()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/library', page: () => AudioPlayerScreen()),
      ],
    );
  }
}
