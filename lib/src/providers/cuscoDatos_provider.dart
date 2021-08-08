import 'package:cuscomovil/src/models/cusco_model_datos.dart';
import 'package:dio/dio.dart';

class CuscoProviderDatos {
  final _url = 'https://cuscoapi.herokuapp.com/api/datos';
  final _http = Dio();

  Future<List<CuscoModelDatos>> obtenerDatos() async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data;
    return data.map((api) => CuscoModelDatos.fromMapJson(api)).toList();
  }
}
