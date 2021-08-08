import 'package:cuscomovil/src/pages/historialEntrada.dart';
import 'package:cuscomovil/src/pages/historialSalida.dart';
import 'package:cuscomovil/src/providers/cusco_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistorialPage extends StatefulWidget {
  HistorialPageState createState() => HistorialPageState();
}

class HistorialPageState extends State<HistorialPage> {
  final _scrollController = ScrollController();
  bool _cargando = false;
  @override
  void initState() {
    final cuscoState = Get.put(CuscoState());
    cuscoState.obtenerDatos();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        if (_cargando == false) {
          setState(() {
            _cargando = true;
          });
          await cuscoState.obtenerDatos();
          setState(() {
            _cargando = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Column(
            children: <Widget>[
              Text("Historial",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              _Tabla(),
              _Filtro(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tabla extends StatelessWidget {
  final cuscoProvider = Get.find<CuscoState>();
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromARGB(255, 183, 238, 250);
    }
    return Color.fromARGB(255, 183, 238, 250);
  }

  Color getColor2(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromARGB(255, 220, 229, 249);
    }
    return Color.fromARGB(255, 220, 229, 249);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CuscoState>(builder: (CuscoState cuscoState) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Container(
          height: 450,
          child: SingleChildScrollView(
            child: DataTable(
              headingRowColor: MaterialStateProperty.resolveWith(getColor),
              dataRowColor: MaterialStateProperty.resolveWith(getColor2),
              columns: [
                DataColumn(label: Text("Estado")),
                DataColumn(label: Text("Fecha")),
                DataColumn(label: Text("Hora"))
              ],
              rows: cuscoProvider.datos.map((_datos) {
                return DataRow(
                  cells: [
                    DataCell(Text(_datos.sensor!)),
                    DataCell(Text(_datos.fecha!)),
                    DataCell(Text(_datos.hora!)),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }
}

class _Filtro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Row(
        children: [
          Text("Filtrar por:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          _BotonesHistorial(),
        ],
      ),
    );
  }
}

class _BotonesHistorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
              backgroundColor: Color.fromARGB(255, 159, 211, 170),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HistorialPageEntrada()));
              },
              label: Text("  Entrada  ",
                  style: TextStyle(fontSize: 20, color: Colors.black))),
          SizedBox(width: 12),
          FloatingActionButton.extended(
              backgroundColor: Color.fromARGB(255, 247, 143, 142),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HistorialPageSalida()));
              },
              label: Text("   Salida   ",
                  style: TextStyle(fontSize: 20, color: Colors.black))),
        ],
      ),
    );
  }
}
