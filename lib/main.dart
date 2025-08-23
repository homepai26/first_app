import 'package:flutter/material.dart';
import 'package:first_app/my_widget.dart';
import 'package:first_app/profile.dart';
//import 'package:first_app/assignment1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Time App',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: MyProfile(),
    );
  }
}