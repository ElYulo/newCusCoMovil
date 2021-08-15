import 'package:cuscomovil/src/models/contador_model.dart';
import 'package:cuscomovil/src/providers/contador_state.dart';
import 'package:cuscomovil/src/providers/cuscoDatos_state.dart';
import 'package:cuscomovil/src/providers/cusco_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pie_chart/pie_chart.dart';

class InicioPage extends StatefulWidget {
  InicioPageState createState() => InicioPageState();
}

class InicioPageState extends State<InicioPage> {
  String conta = '';
  @override
  void initState() {
    final cuscoState = Get.put(CuscoState());
    cuscoState.obtenerDatos();
    final cuscoStateDatos = Get.put(CuscoStateDatos());
    cuscoStateDatos.obtenerDatos();
    final contadorState = Get.put(ContadorState());
    contadorState.obtenerDatos();
    conta = contadorState.contador[0].contador!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 10.0,
          ),
          _titulo(),
          SizedBox(
            height: 10.0,
          ),
          _Clientes(conta),
          SizedBox(
            height: 10.0,
          ),
          _Grafica()
        ],
      ),
    );
  }

  Widget _titulo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Color.fromARGB(255, 185, 191, 201),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
            child: Text("Bienvenidos",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}

class _Clientes extends StatelessWidget {
  String? _contador;
  _Clientes(this._contador);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CuscoStateDatos>(
        builder: (CuscoStateDatos cuscoStateDatos) {
      final _datos = cuscoStateDatos.datos[0];
      final contadorState = Get.put(ContadorState());
      contadorState.obtenerDatos();
      print(_contador);
      return Column(
        children: [
          Text("Clientes actuales:",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Color.fromARGB(255, 159, 211, 170),
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 45),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text("Actual",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 59, 147, 73))),
                          Text(
                            _contador!,
                            style: TextStyle(
                                fontSize: 90,
                                color: Color.fromARGB(255, 59, 147, 73)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 45),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text("Limite",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 207, 25, 42))),
                          //Mostrar limite de personas y transformado a String para mostrar en pantalla
                          Text(_datos.limite!.toString(),
                              style: TextStyle(
                                  fontSize: 90,
                                  color: Color.fromARGB(255, 207, 25, 42))),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}

class _Grafica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CuscoState datos) {
        final sema = datos.datos;
        fechas(int num) {
          double numDias = 0;
          DateTime now = new DateTime.now();
          var dia = DateFormat('dd');
          String formatdia = dia.format(now);
          int diaInt = int.parse(formatdia);
          var date = DateFormat('yyyy-MM-${diaInt - num}');
          String formatterDate = date.format(now);
          for (var i = 0; i < sema.length; i++) {
            if (Jiffy(sema[i].fecha).yMMMMd == Jiffy(formatterDate).yMMMMd &&
                sema[i].sensor == 'entrando') { 
              numDias += 1;
            }
          }
          return numDias;
        }

        fechaActual(int num) {
          DateTime now = new DateTime.now();
          var dia = DateFormat('dd');
          String formatdia = dia.format(now);
          int diaInt = int.parse(formatdia);
          var date = DateFormat('yyyy-MM-${diaInt - num}');
          String formatterDate = date.format(now);
          var a = Jiffy(formatterDate).yMMMMd;
          return a;
        }

        Map<String, double> semana = {
          "${fechaActual(0)}": fechas(0),
          "${fechaActual(1)}": fechas(1),
          "${fechaActual(2)}": fechas(2),
          "${fechaActual(3)}": fechas(3),
          "${fechaActual(4)}": fechas(4),
          "${fechaActual(5)}": fechas(5),
          "${fechaActual(6)}": fechas(6)
        };

        return Column(
          children: [
            Text("Estadisticas:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                SizedBox(width: 15.0),
                Text("- Por semana y hora"),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Container(
                height: 210,
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PieChart(
                      dataMap: semana,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    PieChart(
                      dataMap: semana,
                      chartType: ChartType.ring,
                      chartRadius: 180,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
