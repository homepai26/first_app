import 'package:flutter/material.dart';

class Animated2 extends StatefulWidget {
  const Animated2({super.key});

  @override
  State<Animated2> createState() => _Animated2State();
}

class _Animated2State extends State<Animated2> {
  bool _isLeft = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedAlign(
            alignment: _isLeft ? Alignment.topCenter : Alignment.bottomCenter,
            duration: Duration(milliseconds: 500),
            child: Container(width: 100, height: 100, color: Colors.red),
          ),

          AnimatedPositioned(
            left: _isLeft ? 20 : 200,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              height: 100,
              width: 100,
            ),
            duration: Duration(milliseconds: 500),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                _isLeft = !_isLeft;
              });
            },
            child: Text("Move Bar"),
          ),
        ],
      ),
    );
  }
}
