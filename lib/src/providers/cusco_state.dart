import 'package:cuscomovil/src/models/cusco_model.dart';
import 'package:cuscomovil/src/providers/cusco_provider.dart';
import 'package:get/get.dart';

class CuscoState extends GetxController {
  List<CuscoModel> datos = [];
  List<CuscoModel> datosEntradas = [];
  List<CuscoModel> datosSalidas = [];
  final datosState = CuscoProvider();

  Future<void> obtenerDatos() async {
    datos.addAll(await datosState.obtenerDatos());
    update();
  }

  Future<void> obtenerDatosEntrada() async {
    datos.forEach((element) {
      if (element.sensor == 'entrando') datosEntradas.add(element);
    });
    update();
  }

  Future<void> obtenerDatosSalida() async {
    datos.forEach((element) {
      if (element.sensor == 'saliendo') datosSalidas.add(element);
    });
    update();
  }
}
