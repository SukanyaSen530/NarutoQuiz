import 'package:flutter/material.dart';
import 'package:quizz/widgets/button/dark_button.dart';
import 'package:quizz/widgets/header/main_header.dart';

const startAlignmentVal = Alignment.topRight;
const endAlignmentVal = Alignment.bottomLeft;

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(180, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MainHeader('The Ultimate Naruto Quiz!'),
            const SizedBox(height: 10),
            DarkButton(
              buttonText: 'Start Quiz',
              onTap: startQuiz,
            )
          ],
        ),
      ),
    );
  }
}




/* 
 Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),


  OutlinedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            )
                 OutlinedButton(
               onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(width: 2, color: Colors.black),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Start Quiz'), // <-- Text
                  SizedBox(width: 5),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            )

*/
