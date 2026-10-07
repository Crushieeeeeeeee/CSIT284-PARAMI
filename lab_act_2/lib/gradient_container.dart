import 'package:flutter/material.dart';
import 'styled_text.dart';
 
class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color.fromARGB(255, 70, 255, 64), const Color.fromARGB(255, 22, 41, 219)],
        ),
      ),
      child: Center(
        child: Image.asset('assests/image/dice-2.png'),
      ),
    );
  }
}