import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(TimerHome());

class TimerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: TimerDisplay(),
        ),
      ),
    );
  }
}

class TimerDisplay extends StatefulWidget {
  @override
  _TimerDisplayState createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {
  final stopwatch = Stopwatch();
  late String timeElapsed = stopwatch.elapsed.toString();

  void toggleTimer() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  void resetTimer() => stopwatch.reset();
  String toggleButton() => stopwatch.isRunning ? 'Stop' : 'Start';

  void updateTimer() {
    setState(() => timeElapsed = stopwatch.elapsed.toString());
  }

  @override
  void initState() {
    super.initState();
    Timer timer = Timer.periodic(
        const Duration(milliseconds: 1), (Timer timer) => updateTimer());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(360),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(style: const TextStyle(fontSize: 36), timeElapsed),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => toggleTimer(),
                  child: Text(toggleButton()),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => resetTimer(),
                  child: const Text('Reset'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
