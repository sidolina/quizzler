import 'package:flutter/material.dart';

import 'question.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
    Question(
        q: 'Aproximatly one quarter of human bones are in the feet', a: true),
    Question(q: 'A slug\'s blood is green', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
    Question(q: 'You can lead a cow down stairs but not up stairs', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs', a: true),
  ];

  int questionNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                }
                setState(
                  () {
                    questionNumber++;

                    print(questionNumber);
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                }
                setState(
                  () {
                    questionNumber++;

                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                    print(questionNumber);
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
