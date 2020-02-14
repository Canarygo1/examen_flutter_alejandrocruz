import 'package:examen_flutter_alejandrocruz/data/model/propertis.dart';
import 'package:examen_flutter_alejandrocruz/data/remote/remote_repository.dart';

class HomePresenter {
  HomeView _view;
  RemoteRepository _remoteRepository;
  List<Propertis> propertis = [];

  HomePresenter(this._view, this._remoteRepository);

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
}

abstract class HomeView {
  showOptions(List<Propertis> propertis) {}

  showImage(String url);
}
