import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget{
  GradientContainer({super.key});
  @override
  Widget build(context){
    return Container(
      decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [  Colors.greenAccent,Colors.lightGreenAccent]
              ),
            ),
            child: Center(child: Text(
              'Hello World',
              style: TextStyle(
                fontSize: 48,
                color: Colors.blue
              ),
            ),
    ),
    );
  }
}
