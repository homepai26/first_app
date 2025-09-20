import 'package:flutter/material.dart';

class CounterAssignmentWidget extends StatefulWidget {
  const CounterAssignmentWidget({super.key});

  @override
  State<CounterAssignmentWidget> createState() =>
      _CounterAssignmentWidgetState();
}

class _CounterAssignmentWidgetState extends State<CounterAssignmentWidget> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Widget Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value:', style: TextStyle(fontSize: 24)),
            Text(
              '$counter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
            ),
            const SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: Text(' + Increment'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter--;
                      });
                    },
                    child: Text(' - Decrement'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter = 0;
                      });
                    },
                    child: Text(' Reset'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
