import 'package:cuscomovil/src/models/cusco_model.dart';
import 'package:cuscomovil/src/providers/cusco_provider.dart';
import 'package:get/get.dart';

class CuscoState extends GetxController {
  List<CuscoModel> datos = [];
  final datosState = CuscoProvider();

  Future<void> obtenerDatos() async {
    datos.addAll(await datosState.obtenerDatos());
    update();
  }
}
