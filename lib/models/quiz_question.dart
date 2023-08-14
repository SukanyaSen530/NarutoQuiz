class QuizQuestion {
  QuizQuestion(this.text, this.image, this.answers);

  final String text;
  final String image;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList =
        List.of(answers); // can't reassign the variable for final
    shuffledList.shuffle();
    return shuffledList;
  }
}
