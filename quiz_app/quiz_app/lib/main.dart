import 'package:flutter/material.dart';
import 'package:quiz_app/colorful_text.dart';

void main(){
  runApp(){
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(child:ColorfulText()),
      ),
    )
  }
}