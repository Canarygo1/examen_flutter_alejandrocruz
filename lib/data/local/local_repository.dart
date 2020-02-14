import 'package:examen_flutter_alejandrocruz/data/model/UsernameSave.dart';

abstract class LocalRepository {
  Future<UsernameSave> saveUsername(UsernameSave usernameSave) {}

  Future<UsernameSave> getUsername() {}

  Future<bool> removeUsername(String usernameSave) {}
}
