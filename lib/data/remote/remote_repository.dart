import 'package:examen_flutter_alejandrocruz/data/model/propertis.dart';

abstract class RemoteRepository{
  Future<List<Propertis>> getPropertis(){}
}