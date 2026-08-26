import 'dart:math';
import 'package:flutter/material.dart';
class ColorfulText extends StatefulWidget{
  const ColorfulText ({super.key});
  @override
  State<ColorfulText> createState(){
    return_ColorfulTextState();
  }
}
class _ColorfulTextState extends State<ColorfulText> {
  final randomizer = Random();
  var color {Colors.black, Colors.yellow, Colors.blue, Colors.green, Colors.red}
  int select = 0;

  void startQuiz(){
    setState(() {
      select = randomizer.nextInt(color.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.min,
      children: [
        image.asse
      ],
    )
  }
}