import 'package:flutter/material.dart';

ThemeData light = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white, // สีพื?นหลัง Light Mode
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  ), // สีข้อความ
  appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
);

ThemeData dark = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.blueGrey[900], // สีพื?นหลัง Dark Mode
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ), // สีข้อความ
  appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
);
