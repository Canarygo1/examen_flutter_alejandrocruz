class Question {
  String question;
  String correctAnswer;
  List<String> answers = [];

  Question(this.question, this.correctAnswer, this.answers);

  factory Question.fromJson(Map<String, dynamic> json) {
    var question = json["question"];
    var correctAnswer = json["correct_answer"];
    List<String> answers = [];
    print(json["incorrect_answers"][0]);
    var incorrect1 = json["incorrect_answers"][0];
    var incorrect2 = json["incorrect_answers"][1];
    var incorrect3 = json["incorrect_answers"][2];

    answers.add(incorrect1);
    answers.add(incorrect2);
    answers.add(incorrect3);
    answers.add(correctAnswer);
    answers.sort();
    return (Question(question, correctAnswer, answers));
  }
}
