import 'data/local/preference_local_repository.dart';

class InjectorSharedPreference {
  static final instance = InjectorSharedPreference._internal();

  InjectorSharedPreference._internal() {
    localRepository = Preference_local_repository();
  }

  Preference_local_repository localRepository;
}
