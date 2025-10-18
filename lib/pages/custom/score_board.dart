import 'package:flutter/material.dart';

class ScoreBoard extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final ValueChanged<Color> setTeamWin;
  const ScoreBoard({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.setTeamWin
  });

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 15) {
        widget.setTeamWin(widget.backgroundColor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.title}: $_counter",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Text("Increment"),
          ),
        ],
      ),
    );
  }
}
