import 'package:cuscomovil/src/pages/historial.dart';
import 'package:cuscomovil/src/pages/historialSalida.dart';
import 'package:cuscomovil/src/providers/cusco_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistorialPageEntrada extends StatefulWidget {
  HistorialPageState createState() => HistorialPageState();
}

class HistorialPageState extends State<HistorialPageEntrada> {
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
      body: ListView(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text("Historial",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          ),
          _Tabla(_scrollController),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Row(
              children: [
                Text("Filtrar por:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ],
            ),
          ),
          Container(
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
                                  HistorialPage()));
                    },
                    label: Text("  Historial  ",
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
          )
        ],
      ),
    );
  }
}

class _Tabla extends StatelessWidget {
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

  final ScrollController _scrollController;
  _Tabla(this._scrollController);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CuscoState>(builder: (CuscoState cuscoState) {
      return GridView.builder(
        controller: _scrollController,
        itemCount: cuscoState.datos.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int i) {
          final _datos = cuscoState.datos[i];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Container(
                height: 450,
                child: ListView(
                  children: [
                    DataTable(
                        headingRowColor:
                            MaterialStateProperty.resolveWith(getColor),
                        dataRowColor:
                            MaterialStateProperty.resolveWith(getColor2),
                        columns: [
                          DataColumn(label: Text("Estado")),
                          DataColumn(label: Text("Fecha")),
                          DataColumn(label: Text("Hora"))
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(_datos.sensor!)),
                            DataCell(Text(_datos.fecha!)),
                            DataCell(Text(_datos.hora!)),
                          ]),
                        ]),
                  ],
                )),
          );
        },
      );
    });
  }
}
