import 'package:cuscomovil/src/models/cusco_model_datos.dart';
import 'package:cuscomovil/src/providers/cuscoDatos_provider.dart';
import 'package:get/get.dart';

class CuscoStateDatos extends GetxController {
  List<CuscoModelDatos> datos = [];
  final datoState = CuscoProviderDatos();

  Future<void> obtenerDatos() async {
    datos.addAll(await datoState.obtenerDatos());
    update();
  }
}
