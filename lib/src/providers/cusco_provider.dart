import 'package:cuscomovil/src/models/cusco_model.dart';
import 'package:dio/dio.dart';

class CuscoProvider {
  final _url = 'https://cuscoapi.herokuapp.com/api/sensor';
  final _http = Dio();

  Future<List<CuscoModel>> obtenerDatos() async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data;
    return data.map((api) => CuscoModel.fromMapJson(api)).toList();
  }
}
