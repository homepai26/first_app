import 'package:flutter/material.dart';

class Animated3 extends StatefulWidget {
  const Animated3({super.key});

  @override
  State<Animated3> createState() => _Animated3State();
}

class _Animated3State extends State<Animated3> {
  bool _isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: _isFirst
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  )
                : Text("Gotcha!"),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                _isFirst = !_isFirst;
              });
            },
            child: Text("Switch"),
          ),
        ],
      ),
    );
  }
}
