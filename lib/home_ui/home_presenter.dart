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
}

abstract class HomeView {
  showOptions(List<Propertis> propertis) {}
}
