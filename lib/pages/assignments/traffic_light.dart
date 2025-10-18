import 'package:flutter/material.dart';

class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  List<double> lightOpacity = [1, 0.3, 0.3];
  int _state = 0;

  void setTrafficLightOpacity(int state) {
    for(int i = 0; i < lightOpacity.length; i++) {
      lightOpacity[i] = i == state ? 1 : 0.3;
    }
  }

  void updateState() {
    setState(() {
      _state = (_state + 1) % 3;
      print(_state);
      setTrafficLightOpacity(_state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Traffic Light")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            AnimatedOpacity(
              opacity: lightOpacity[0],
              duration: Duration(seconds: 1),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  boxShadow: [BoxShadow(
                    color: Colors.red,
                    blurRadius: 10
                  )]
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: lightOpacity[1],
              duration: Duration(seconds: 1),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                  boxShadow: [BoxShadow(
                    color: Colors.yellow,
                    blurRadius: 10
                  )]
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: lightOpacity[2],
              duration: Duration(seconds: 1),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  boxShadow: [BoxShadow(
                    color: Colors.green,
                    blurRadius: 10
                  )]
                ),
              ),
            ),

            ElevatedButton(onPressed: () => updateState(), child: Text("เปลี่ยนไฟ"))
          ],
        ),
      ),
    );
  }
}
