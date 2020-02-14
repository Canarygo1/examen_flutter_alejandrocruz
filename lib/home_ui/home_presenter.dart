import 'package:examen_flutter_alejandrocruz/data/local/local_repository.dart';
import 'package:examen_flutter_alejandrocruz/data/model/UrlSave.dart';
import 'package:examen_flutter_alejandrocruz/data/model/UsernameSave.dart';
import 'package:examen_flutter_alejandrocruz/data/model/propertis.dart';
import 'package:examen_flutter_alejandrocruz/data/remote/remote_repository.dart';
import 'package:flutter/services.dart';

class HomePresenter {
  HomeView _view;
  RemoteRepository _remoteRepository;
  List<Propertis> propertis = [];
  LocalRepository _localRepository;

  HomePresenter(this._view, this._remoteRepository, this._localRepository);

  Future<void> init() async {
    propertis = await _remoteRepository.getPropertis();
    _view.showOptions(propertis);
  }

  selectionChanged(String eyes, String mouth, String nose) {
    if (eyes == "Select the eyes" ||
        mouth == "Select the mouth" ||
        nose == "Select the nose") {
      _view.showImage("");
    } else {
      String url =
          "https://api.adorable.io/avatars/face/${eyes}/${nose}/${mouth}/EDEDFF/200";
      _view.showImage(url);
    }
  }

  Future<void> saveTapped(String username,String url) async {
    if (username.isNotEmpty && url.isNotEmpty) {
      UsernameSave usernameSave = UsernameSave(username,url);
      UsernameSave usernameResponse =
          await _localRepository.saveUsername(usernameSave);

      _view.goToDetail();
    } else {
      _view.nosave();
    }
  }
}

abstract class HomeView {
  showOptions(List<Propertis> propertis) {}

  goToDetail() {}

  showImage(String url);

  nosave() {}
}
