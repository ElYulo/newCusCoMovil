import 'package:cuscomovil/src/models/contador_model.dart';
import 'package:cuscomovil/src/providers/contador_provider.dart';
import 'package:get/get.dart';

class ContadorState extends GetxController {
  List<ContadorModel> contador = [];
  final contadorState = ContadorProvider();

  Future<void> obtenerDatos() async {
    contador.addAll(await contadorState.obtenerDatos());
    update();
  }
}
