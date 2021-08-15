import 'package:cuscomovil/src/models/cusco_model_datos.dart';
import 'package:cuscomovil/src/providers/cuscoDatos_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CuscoStateDatos extends GetxController {
  final _url = 'https://cuscoapi.herokuapp.com/api/datos';
  final _http = Dio();
  List<CuscoModelDatos> datos = [];
  final datoState = CuscoProviderDatos();
  List<CuscoModelDatos> limite = [];
  late CuscoModelDatos limites;
  bool guardando = false;

  Future<void> obtenerDatos() async {
    datos.addAll(await datoState.obtenerDatos());
    update();
  }

  Future<void> editarLimite() async {
    guardando = true;
    update();
    await _http.put('${_url}/${limite[0].limite}', data: limites.toJson());
    final indexLimite =
        limite.indexWhere((limitesData) => limites.id == limitesData.id);
    limite[indexLimite] = limites;
    guardando = false;
    update();
  }
}
