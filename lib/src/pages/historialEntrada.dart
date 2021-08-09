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
    cuscoState.obtenerDatosEntrada();
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 182, 200, 236),
        centerTitle: true,
        title: Text(
          "CusCO",
          style: TextStyle(color: Color.fromARGB(255, 19, 57, 121)),
        ),
        actions: [
          Image.asset(
            'assets/cusco.png',
            scale: 30.0,
          ),
          SizedBox(
            width: 15.0,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Historial de entradas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(
              child: SingleChildScrollView(child: _Tabla()),
              height: 800.0,
            ),
          ],
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
        child: Center(
            child: DataTable(
          headingRowColor: MaterialStateProperty.resolveWith(getColor),
          dataRowColor: MaterialStateProperty.resolveWith(getColor2),
          columns: [
            DataColumn(label: Text("Estado")),
            DataColumn(label: Text("Fecha")),
            DataColumn(label: Text("Hora"))
          ],
          rows: cuscoProvider.datosEntradas.map((_datos) {
            return DataRow(
              cells: [
                DataCell(Text(_datos.sensor!)),
                DataCell(Text(_datos.fecha!)),
                DataCell(Text(_datos.hora!)),
              ],
            );
          }).toList(),
        )),
      );
    });
  }
}
