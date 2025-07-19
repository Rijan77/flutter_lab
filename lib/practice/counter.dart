import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import 'home_screen.dart';

class TimerDisplayPage extends StatefulWidget {
  final DateTime endTime;

  const TimerDisplayPage({super.key, required this.endTime});

  @override
  _TimerDisplayPageState createState() => _TimerDisplayPageState();
}

class _TimerDisplayPageState extends State<TimerDisplayPage> {
  final DateTime sharedEndTime = DateTime.now().add(
      const Duration(minutes: 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 100,
              color: Colors.blueGrey,
              child: Center(
                child: TimerCountdown(
                    timeTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    descriptionTextStyle: const TextStyle(color: Colors.white),
                    colonsTextStyle: const TextStyle(color: Colors.white),
                    format: CountDownTimerFormat.minutesSeconds,
                    onEnd: () {
                      exit(0);
                    },
                    endTime: sharedEndTime),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CounterPage(endTime: sharedEndTime),
                      ));
                },

                child: const Text("Next Page"))
          ],
        ),
      ),
    );
  }
}
