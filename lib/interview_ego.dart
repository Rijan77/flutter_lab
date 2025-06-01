import 'package:flutter/material.dart';

class InterviewEgo extends StatefulWidget {
  const InterviewEgo({super.key});

  @override
  State<InterviewEgo> createState() => _InterviewEgoState();
}

class _InterviewEgoState extends State<InterviewEgo> {

  var myList = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50];

  int currentIndex = 0;



  void enterList(){
    if(currentIndex < myList.length-1){
      setState(() {
        currentIndex++;
      });

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reached into the end")));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical:200),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       disabledBorder: OutlineInputBorder(),
            //       enabledBorder: OutlineInputBorder(),
            //       focusedBorder: OutlineInputBorder()
            //     ),
            //   ),
            // )

            Text(
              myList[currentIndex].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black
              ),
            ),


            ElevatedButton(onPressed: enterList, child: Text("Enter"))
          ],
        ),
      ),

    );
  }
}
