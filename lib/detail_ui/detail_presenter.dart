import 'package:examen_flutter_alejandrocruz/data/local/local_repository.dart';
import 'package:examen_flutter_alejandrocruz/data/model/UrlSave.dart';
import 'package:examen_flutter_alejandrocruz/data/model/UsernameSave.dart';

class DetailPresenter {
  DetailView _view;
  LocalRepository _localRepository;

  DetailPresenter(this._view, this._localRepository);

  init() async {
    UsernameSave usernameSave = await _localRepository.getUsername();

    _view.showUsername(usernameSave.username, usernameSave.url);
  }
}

abstract class DetailView {
  showUsername(String username, String url) {}
}
