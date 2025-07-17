import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:riverpod_state/practice/homepage.dart';

import 'home_screen.dart';

class TimerDisplayPage extends StatefulWidget {

  final DateTime endTime;
  TimerDisplayPage({super .key, required this.endTime});

  @override
  _TimerDisplayPageState createState() => _TimerDisplayPageState();


}

class _TimerDisplayPageState extends State<TimerDisplayPage> {
  final DateTime sharedEndTime = DateTime.now().add(Duration(minutes: 10));


  @override
  Widget build(BuildContext context) {


    return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children:  [
           TimerCountdown(
               format: CountDownTimerFormat.minutesSeconds,
               onEnd: () {print("Timer finished");
               },
           
                 endTime: sharedEndTime),

           SizedBox(height: 50,),
           ElevatedButton(onPressed: (){

             Navigator.push(context, MaterialPageRoute(builder: (_) => CounterPage(endTime: sharedEndTime),));
           }, child: Text("Next Page"))
         ],

       ),
     ),
    );
  }
}
