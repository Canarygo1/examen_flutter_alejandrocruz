import 'dart:convert';

import 'package:examen_flutter_alejandrocruz/data/model/Question.dart';
import 'package:examen_flutter_alejandrocruz/data/remote/remote_repository.dart';
import 'package:http/http.dart';


class HttpRemoteRepository implements RemoteRepository {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<List<Question>> getQuestions() async {
    var response = await _client
        .get('https://opentdb.com/api.php?amount=10&type=multiple');

    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      List jsonList = jsonBody['results'];
      List<Question> questions = [];
      for (int i = 0; i < jsonList.length; i++) {
        print(jsonList[i]["incorrect_answers"]);
        Question question = Question.fromJson(jsonList[i]);

        questions.add(question);
      }
      Questions allQuestions = Questions();
      allQuestions.addQuestions(questions);
      return allQuestions;
    } else {
      throw StateError('Error');
    }
  }
}
