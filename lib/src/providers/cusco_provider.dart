import 'package:cuscomovil/src/models/cusco_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

class CuscoProvider {
  final _url = 'https://cuscoapi.herokuapp.com/api/sensor';
  final _http = Dio();
  final _storage = storage.FlutterSecureStorage();

  Future<List<CuscoModel>> obtenerDatos() async {
    final response = await _http.get(_url,
        options: Options(headers: {
          'Authorization': 'Bearer ${await _storage.read(key: 'token')}'
        }));
    List<dynamic> data = response.data;
    return data.map((api) => CuscoModel.fromMapJson(api)).toList();
  }
}
