import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: _buildTop(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              width: double.infinity,
              color: Colors.green,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              width: double.infinity,
              color: Colors.yellowAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              width: double.infinity,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildTop() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              color: Color(0xff13366E),
              width: double.infinity,
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
