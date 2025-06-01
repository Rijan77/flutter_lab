import 'dart:async';

import 'package:flutter/material.dart';

class LearnBuilder extends StatefulWidget {
  const LearnBuilder({super.key});

  @override
  State<LearnBuilder> createState() => _LearnBuilderState();
}

class _LearnBuilderState extends State<LearnBuilder> {

  final List <int> myList = [1, 5, 10, 15, 20, 25, 30];

  final StreamController<int> _controller = StreamController();

  int currentIndex = 0;

  void showNextNum(){
    if (currentIndex < myList.length){

      _controller.sink.add(myList[currentIndex]);

      currentIndex++;
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No More Number")));
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              height: 200,
              width: 200,
              
            ),
            SizedBox(height: 100,),
            ElevatedButton(onPressed: showNextNum, child: Text("Enter"))
          ],
        ),
      ),
    );
  }
}
