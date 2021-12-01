import 'package:flutter/material.dart';

import 'clothes_answer.dart';
import 'clothes_question.dart';

void main() {
  runApp(ClothingSelectorBuilder());
}

class ClothingSelectorBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatefulClothingSelector(),
    );
  }
}

class StatefulClothingSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClothingSelector(title: 'Select clothes');
  }
}

class _ClothingSelector extends State<StatefulClothingSelector> {
  String title;
  var questions = [
    {
      "question": "Select T-Shirt:",
      "answer": ["Nike", "Adidas", "Supreme", "Rebook", "Polo Ralph Lauren"]
    },
    {
      "question": "Select T-Shirt size:",
      "answer": ["XS", "S", "M", "L", "XL"]
    },
    {
      "question": "Select Jeans:",
      "answer": ["Dickies", "Levi's", "Everlane"]
    },
    {
      "question": "Select Jeans size (in EUR):",
      "answer": ["38", "40", "42", "44", "46", "48"]
    },
    {
      "question": "Select Shoes:",
      "answer": ["Nike", "Vans", "Adidas", "Puma", "Rebook", "Lacoste"]
    },
    {
      "question": "Select Shoes size (in EUR):",
      "answer": [
        "35",
        "36",
        "37",
        "38",
        "39",
        "40",
        "41",
        "42",
        "43",
        "44",
        "45"
      ]
    },
  ];
  var questionIndex = 0;

  void _onQuestionAnswer() {
    if (questionIndex == questions.length - 1) {
      return;
    }
    setState(() {
      questionIndex += 1;
    });
  }

  _ClothingSelector({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 15),
                child: ClothesQuestion(
                    questions[questionIndex]["question"].toString())),
            ...(questions[questionIndex]["answer"] as List<String>)
                .map((answer) {
              return Container(
                margin: EdgeInsets.all(15),
                child: ClothesAnswer(answer, _onQuestionAnswer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
