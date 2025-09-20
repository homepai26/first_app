import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    counter = 10;
    super.initState();
  }

  Color getColorBox() {
    if (counter % 2 == 0) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First StetefulWidget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color: getColorBox(), child: Text('Counter : $counter')),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Text(' + Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
