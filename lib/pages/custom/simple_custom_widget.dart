import 'package:first_app/pages/custom/custom_card.dart';
import 'package:flutter/material.dart';

class SimpleCustomWidget extends StatefulWidget {
  const SimpleCustomWidget({super.key});

  @override
  State<SimpleCustomWidget> createState() => _SimpleCustomWidgetState();
}

class _SimpleCustomWidgetState extends State<SimpleCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCard(text: "Hello", color: Colors.red),
            CustomCard(text: "WOrld", color: Colors.green),
            CustomCard(text: "Good", color: Colors.blue),
            CustomCard(text: "Morning", color: Colors.yellow),
            CustomCard(text: "Morning"),
          ],
        ),
      ),
    );
  }
}
