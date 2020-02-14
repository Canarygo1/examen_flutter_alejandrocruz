import 'dart:convert';

import 'package:examen_flutter_alejandrocruz/data/model/propertis.dart';
import 'package:examen_flutter_alejandrocruz/data/remote/remote_repository.dart';
import 'package:http/http.dart';

class HttpRemoteRepository implements RemoteRepository {
  final Client _client;

  HttpRemoteRepository(this._client);

  @override
  Future<List<Propertis>> getPropertis() async {
    var response = await _client.get('https://api.adorable.io/avatars/list');

    if (response.statusCode == 200) {
      List<Propertis> atributes = [];
      var jsonBody = json.decode(response.body);
      Map<String, dynamic> jsonList = jsonBody['face'];
      List<String> listEye = jsonList['eyes'].cast<String>();
      List<String> listNose = jsonList['nose'].cast<String>();
      List<String> listMouth = jsonList['mouth'].cast<String>();

      Propertis propertisEye = Propertis.fromJson(listEye);
      atributes.add(propertisEye);
      Propertis propertisNose = Propertis.fromJson(listNose);
      atributes.add(propertisNose);
      Propertis propertisMouth = Propertis.fromJson(listMouth);
      atributes.add(propertisMouth);

      return atributes;
    } else {
      throw StateError('Error');
    }
  }
}
