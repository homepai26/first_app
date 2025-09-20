import 'package:first_app/api_example/api_example.dart';
import 'package:first_app/pages/assignments/form_input.dart';
import 'package:first_app/pages/counter_assignment_widget.dart';
import 'package:first_app/pages/counter_widget.dart';
import 'package:first_app/pages/forms/form_expample1_controller.dart';
import 'package:first_app/pages/greeting_widget.dart';
import 'package:first_app/navigation/first_page.dart';
import 'package:first_app/navigation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/my_widget.dart';
import 'package:first_app/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:first_app/assignment1.dart';
import 'package:first_app/api_example/model/user.dart';

void main() {
  runApp(MyApp());
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
      //initialRoute: '/',
      /*       routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/counter': (context) => const CounterAssignmentWidget(),
      }, */
      home: ApiExample(),
    );
  }
}
