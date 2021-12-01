import 'package:flutter/material.dart';

class ClothesAnswer extends StatelessWidget {
  String answer;
  VoidCallback functionPointer;

  ClothesAnswer(this.answer, this.functionPointer);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
          answer,
          style: TextStyle(color: Colors.red, fontSize: 25),
        ),
        onPressed: functionPointer,
        style: ElevatedButton.styleFrom(primary: Colors.green));
  }
}
