import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CounterPage extends ConsumerWidget {
  final DateTime endTime;

  CounterPage({super.key, required this.endTime});

  final counterProvider = StateProvider<int>((ref) {
    return 0;
  });

  final switchProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the counter state
    print("Build1");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_sharp)),
        title: Center(child: Text("Helo Timer")),
      ),
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
                  timeTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  descriptionTextStyle: TextStyle(color: Colors.white),
                  colonsTextStyle: TextStyle(color: Colors.white),
                  format: CountDownTimerFormat.minutesSeconds,
                  endTime: endTime,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
