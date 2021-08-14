import 'package:cuscomovil/src/models/cusco_model_datos.dart';
import 'package:dio/dio.dart';

class CuscoProviderDatos {
  final _url = 'https://cuscoapi.herokuapp.com/api/datos';
  final _http = Dio();
  //usuarios
  List<CuscoModelDatos> limite = [];
  //usuario
  late CuscoModelDatos limites;
  bool guardando = false;

  Future<List<CuscoModelDatos>> obtenerDatos() async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data;
    return data.map((api) => CuscoModelDatos.fromMapJson(api)).toList();
  }

  Future<void> editar() async {
    if (limites.id != null) await editarLimite();
  }

  //Funcion de editar limite
  Future<void> editarLimite() async {
    await _http.put('${_url}/${limite[0].limite}', data: limites.toJson());
    final indexLimite =
        limite.indexWhere((limitesData) => limites.id == limitesData.id);
    limite[indexLimite] = limites;
  }
}
