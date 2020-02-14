
import 'package:http/http.dart';
import 'data/remote/http_remote_repository.dart';
import 'data/remote/remote_repository.dart';

class Injector {
  static final instance = Injector._internal();

  Injector._internal(){
    remoteRepository = HttpRemoteRepository(Client());
  }

  RemoteRepository remoteRepository;
}