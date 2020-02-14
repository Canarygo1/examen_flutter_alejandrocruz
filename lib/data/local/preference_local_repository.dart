import 'dart:convert';

import 'package:examen_flutter_alejandrocruz/data/local/local_repository.dart';
import 'package:examen_flutter_alejandrocruz/data/model/UrlSave.dart';
import 'package:examen_flutter_alejandrocruz/data/model/UsernameSave.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference_local_repository implements LocalRepository {
  SharedPreferences _sharedPreferences;

  Preference_local_repository();

  @override
  Future<UsernameSave> getUsername() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (_sharedPreferences.containsKey('username')) {
      String username = _sharedPreferences.getString('username');
      return UsernameSave.fromMap(json.decode(username));
    } else {
      return null;
    }
  }

  @override
  Future<bool> removeUsername(String usernameSave) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return null;
  }

  @override
  Future<UsernameSave> saveUsername(UsernameSave usernameSave) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String username = json.encode(usernameSave.toMap());
    if (await _sharedPreferences.setString('username', username)) {
      return usernameSave;
    } else {
      return null;
    }
  }
}
