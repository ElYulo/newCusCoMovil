import 'package:dio/dio.dart';
import 'package:cuscomovil/src/models/contador_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

class ContadorProvider {
  final _url = 'https://cuscoapi.herokuapp.com/api/contador';
  final _http = Dio();
  final _storage = storage.FlutterSecureStorage();

  Future<List<ContadorModel>> obtenerDatos() async {
    final response = await _http.get(_url,
        options: Options(headers: {
          'Authorization': 'Bearer ${await _storage.read(key: 'token')}'
        }));
    List<dynamic> data = response.data;
    return data.map((api) => ContadorModel.fromMapJson(api)).toList();
  }
}
