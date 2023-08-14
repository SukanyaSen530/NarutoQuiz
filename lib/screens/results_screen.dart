import 'package:flutter/material.dart';
import 'package:quizz/widgets/header/main_header.dart';

import 'package:quizz/widgets/questions_summary.dart';

import 'package:quizz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswer, required this.restartQuiz});

  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  //getter method
  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numOfTotalQuestions = questions.length;
    final numOfCorrectAnswers = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity, //be as wide as possible
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(220, 1, 1, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  MainHeader(
                    'You have answered $numOfCorrectAnswers out of $numOfTotalQuestions questions correctly!',
                    headerTextColor: Colors.yellow,
                  ),
                  const SizedBox(height: 20),
                  QuestionSummary(summaryData),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: restartQuiz,
                    icon: const Icon(Icons.restart_alt),
                    label: const Text('Restart Quiz'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(width: 2.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
