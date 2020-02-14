import 'package:examen_flutter_alejandrocruz/data/local/local_repository.dart';
import 'package:examen_flutter_alejandrocruz/data/remote/remote_repository.dart';
import 'package:examen_flutter_alejandrocruz/home_ui/home_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteRepository extends Mock implements RemoteRepository {}

class MockListView extends Mock implements HomeView {}
class MockLocalRepository extends Mock implements LocalRepository{}
void main(){
  RemoteRepository mockRemoteRepository = MockRemoteRepository();
  HomeView mockListView = MockListView();
  LocalRepository localRepository = MockLocalRepository();
  test("Should show a list", () async {

  });
}