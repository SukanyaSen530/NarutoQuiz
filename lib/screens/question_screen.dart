import 'package:flutter/material.dart';
import 'package:quizz/data/questions.dart';
import 'package:quizz/widgets/button/answer_button.dart';
import 'package:quizz/widgets/header/secondary_header.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

//_ to make it private class
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  var showHintImage = false;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
      showHintImage = false;
    });
  }

  void onHintButtonPress() {
    setState(() {
      showHintImage = true;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //be as wide as possible
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //this column is for taking whole length of the screen so that content is at center
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(180, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //this column is for taking the content length of the screen
                children: [
                  SecondaryHeader(
                    headerText: currentQuestion.text,
                  ),

                  const SizedBox(height: 5),

                  if (!showHintImage && currentQuestion.image != '')
                    TextButton(
                      onPressed: onHintButtonPress,
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(bottom: 5)),
                      child: const Text('Hint?'),
                    ),

                  if (showHintImage && currentQuestion.image != '')
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image(
                        image: NetworkImage(currentQuestion.image),
                        height: 150,
                      ),
                    ),

                  ...currentQuestion.shuffledAnswers.map((item) => AnswerButton(
                      answerText: item, onTap: () => answerQuestion(item)))
                  //spread operator is used because column expects only widget, not normal data
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
