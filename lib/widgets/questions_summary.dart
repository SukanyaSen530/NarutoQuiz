import 'package:flutter/widgets.dart';
import 'package:quizz/widgets/circular_num.dart';
import 'package:quizz/widgets/header/secondary_header.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  final Color correctAnswerColor = const Color.fromRGBO(170, 246, 131, 1);
  final Color wrongAnswerColor = const Color.fromRGBO(218, 98, 125, 1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((item) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircularNum(
                        ((item['question_index'] as int) + 1).toString(),
                        bgColor: item['correct_answer'] == item['user_answer']
                            ? correctAnswerColor
                            : wrongAnswerColor,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            SecondaryHeader(
                              headerText: (item['question_text'] as String),
                              headerTextSize: 14,
                              headerTextColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                            ),
                            const SizedBox(height: 5),
                            SecondaryHeader(
                              headerText: (item['user_answer'] as String),
                              headerTextSize: 14,
                              headerTextColor:
                                  item['correct_answer'] == item['user_answer']
                                      ? correctAnswerColor
                                      : wrongAnswerColor,
                            ),
                            if (item['correct_answer'] != item['user_answer'])
                              SecondaryHeader(
                                headerText: (item['correct_answer'] as String),
                                headerTextSize: 14,
                                headerTextColor: correctAnswerColor,
                              ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
