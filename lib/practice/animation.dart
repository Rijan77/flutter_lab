import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationTry extends StatelessWidget {
  const AnimationTry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          "Hello Rijan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
            .animate(
              delay: 1000.ms,
              onPlay: (controller) => controller.repeat(),
            )
            .fadeIn(delay: 500.ms)
            .slide(),
      ),
    );
  }
}
