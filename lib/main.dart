import 'dart:core';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_Brain.dart';

QuizBrain quizB = QuizBrain();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Center(
              child: Text(
                'Quizzler App',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Quizz_page(),
          ),
        ),
      ),
    );
  }
}

class Quizz_page extends StatefulWidget {
  const Quizz_page({Key? key}) : super(key: key);

  @override
  _Quizz_pageState createState() => _Quizz_pageState();
}

class _Quizz_pageState extends State<Quizz_page> {
  List<Widget> scrocekeeper = [];

  void checkanswer(bool user) {
    bool correctanswer = quizB.getQuestionAnswer();
    setState(() {
      if (quizB.finished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizB.reset();
        scrocekeeper = [];
      } else {
        if (correctanswer == user) {
          scrocekeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          quizB.nextQuestion();
        } else {
          scrocekeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          quizB.nextQuestion();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizB.getQuestionText(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.teal,
            child: TextButton(
              onPressed: () {
                checkanswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                checkanswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: scrocekeeper,
          ),
        )
      ],
    );
  }
}
