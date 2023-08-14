import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';

import 'package:quizz/screens/question_screen.dart';
import 'package:quizz/screens/results_screen.dart';
import 'package:quizz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
//  Widget? activeScreen; // can be null
  var activeScreen = 'start-screen';
  List<String> _selectedAnswers = []; //private variable

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      _selectedAnswers = [];
    });
  }

  @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
          chosenAnswer: _selectedAnswers, restartQuiz: restartQuiz);
    }

    return MaterialApp(
      title: 'Flutter Quiz',
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/bg/naruto_bg.png',
                  ),
                ),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    const Color.fromRGBO(250, 148, 39, 1).withOpacity(0.8),
                    const Color.fromRGBO(252, 186, 33, 1).withOpacity(0.8),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
              child: screenWidget,
            ),
          ],
        ),
      ),
    );
  }
}
