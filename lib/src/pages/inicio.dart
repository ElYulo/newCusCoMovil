import 'package:cuscomovil/src/models/contador_model.dart';
import 'package:cuscomovil/src/providers/contador_state.dart';
import 'package:cuscomovil/src/providers/cuscoDatos_state.dart';
import 'package:cuscomovil/src/providers/cusco_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class InicioPage extends StatefulWidget {
  InicioPageState createState() => InicioPageState();
}

class InicioPageState extends State<InicioPage> {
  @override
  void initState() {
    final cuscoState = Get.put(CuscoState());
    cuscoState.obtenerDatos();
    final cuscoStateDatos = Get.put(CuscoStateDatos());
    cuscoStateDatos.obtenerDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contadorState = Get.put(ContadorState());
    contadorState.obtenerDatos();
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
          _Clientes(contadorState.contador[0].contador),
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
  Map<String, double> semana = {
    "Lunes": 5,
    "Martes": 3,
    "Miercoles": 2,
    "Jueves": 2,
    "viernes": 6,
    "Sabado": 8,
    "Domingo": 9
  };
  Map<String, double> hora = {
    "08 - 09 hrs": 5,
    "09 - 10 hrs": 3,
    "10 - 11 hrs": 2,
    "11 - 12 hrs": 2,
    "12 - 13 hrs": 6,
    "13 - 14 hrs": 8,
    "14 - 15 hrs": 9
  };
  @override
  Widget build(BuildContext context) {
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
                  width: 10.0,
                ),
                PieChart(
                  dataMap: hora,
                  chartType: ChartType.ring,
                  chartRadius: 180,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
