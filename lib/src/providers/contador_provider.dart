import 'package:dio/dio.dart';
import 'package:cuscomovil/src/models/contador_model.dart';

class ContadorProvider {
  final _url = 'https://cuscoapi.herokuapp.com/api/contador';
  final _http = Dio();

  Future<List<ContadorModel>> obtenerDatos() async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data;
    return data.map((api) => ContadorModel.fromMapJson(api)).toList();
  }
}
