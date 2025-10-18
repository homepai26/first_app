import 'package:first_app/pages/custom/custom_card.dart';
import 'package:first_app/pages/custom/score_board.dart';
import 'package:flutter/material.dart';

class ScoreBoardScaffold extends StatefulWidget {
  const ScoreBoardScaffold({super.key});

  @override
  State<ScoreBoardScaffold> createState() => _ScoreBoardScaffoldState();
}

class _ScoreBoardScaffoldState extends State<ScoreBoardScaffold> {
  Color backgroundTeamWin = Colors.white;

  void setTeamWin(Color color) {
    setState(() {
      backgroundTeamWin = color;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widget")),
      backgroundColor: backgroundTeamWin,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ScoreBoard(title: "TEAM A", backgroundColor: Colors.red, setTeamWin: setTeamWin),
            SizedBox(height: 10),
            ScoreBoard(title: "TEAM B", backgroundColor: Colors.blue, setTeamWin: setTeamWin,),
          ],
        ),
      ),
    );
  }
}
