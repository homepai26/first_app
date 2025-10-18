import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  const CustomCard({super.key, required this.text, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(text)),
    );
  }
}
