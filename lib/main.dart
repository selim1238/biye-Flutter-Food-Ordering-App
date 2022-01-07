import 'package:deneme/colors.dart';
import 'package:deneme/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LoginPage",
      theme:
          ThemeData(primaryColor: customColor1, primarySwatch: Colors.orange),
      home: const LoginPage(),
    );
  }
}
