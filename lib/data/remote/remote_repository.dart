import 'package:examen_flutter_alejandrocruz/data/model/Question.dart';

abstract class RemoteRepository{
  Future<List<Question>> getQuestions(){}
}