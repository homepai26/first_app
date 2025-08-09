import 'package:flutter/material.dart';

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
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png",
              width: 100,
              height: 100,
            ),
            Image.asset(
              "google-logo.png",
              width: 100,
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                print("Clicked");
              },
              child: Text("Click me!"),
            ),
            TextButton(
              onPressed: () {
                print("Clicked Text Button!");
              },
              child: Text("Click for information"),
            ),
          ],
        ),
      ),
    );
  }
}
