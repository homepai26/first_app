import 'package:first_app/animation/animated.dart';
import 'package:first_app/animation/animated2.dart';
import 'package:first_app/animation/animated3.dart';
import 'package:first_app/api_example/api_example.dart';
import 'package:first_app/api_example/api_example_listview.dart';
import 'package:first_app/constant/theme.dart';
import 'package:first_app/pages/assignments/assignment5.dart';
import 'package:first_app/pages/assignments/form_input.dart';
import 'package:first_app/pages/assignments/product.dart';
import 'package:first_app/pages/assignments/traffic_light.dart';
import 'package:first_app/pages/counter_assignment_widget.dart';
import 'package:first_app/pages/counter_widget.dart';
import 'package:first_app/pages/custom/profile_card_scaffold.dart';
import 'package:first_app/pages/custom/scoreboard_scaffold.dart';
import 'package:first_app/pages/custom/simple_custom_widget.dart';
import 'package:first_app/pages/forms/form_expample1_controller.dart';
import 'package:first_app/pages/greeting_widget.dart';
import 'package:first_app/navigation/first_page.dart';
import 'package:first_app/navigation/second_page.dart';
import 'package:first_app/pages/test_dark_light.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/my_widget.dart';
import 'package:first_app/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:first_app/assignment1.dart';
import 'package:first_app/api_example/model/user.dart';

// exam: 2 part {sum:40 point, lecture: 20 points (choise thinking designing ui to pic page what doing used component? widget?) (basic form->api many ? method?), lab 20 point (3 supperate question) (form(screen, cal, input, sumary calurate) screen-layout) api scren-;ayout method listview, only display กระดานข่าว}
// term project 3 week after exam

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Time App',
      themeMode: _themeMode,
      darkTheme: dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)
        )
      ),
      debugShowCheckedModeBanner: false,
      //initialRoute: '/',
      /*       routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/counter': (context) => const CounterAssignmentWidget(),
      }, */
      home: TrafficLight(),
    );
  }
}
