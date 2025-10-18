import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  double _size = 100;
  Color _color = Colors.red;
  double _opacity = 1.0;
  double _padding = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: Duration(milliseconds: 500),
              child: Container(width: 100, height: 100, color: Colors.amber),
            ),

            AnimatedContainer(
              duration: Duration(milliseconds: 25),
              height: _size,
              width: _size,
              color: _color,
            ),
            SizedBox(height: 20),

            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Text("Hi CUSU!"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _size = _size == 100 ? 150 : 100;
                  _color = _color == Colors.red ? Colors.blue : Colors.red;
                  _opacity = _opacity == 1.0 ? 0.0 : 1.0;
                  _padding = _padding == 10 ? 50 : 10;
                });
              },
              child: Text("Animated Box"),
            ),
          ],
        ),
      ),
    );
  }
}
