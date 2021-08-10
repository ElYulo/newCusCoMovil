import 'package:cuscomovil/src/providers/cuscoDatos_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AjustesPage extends StatefulWidget {
  AjustesPageState createState() => AjustesPageState();
}

class AjustesPageState extends State<AjustesPage> {
  @override
  void initState() {
    final cuscoStateDatos = Get.put(CuscoStateDatos());
    cuscoStateDatos.obtenerDatos();
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
      body: ListView(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _titulo(),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text("Bienvenido a la seleccion de ajustes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          _Ajustes(),
          Center(
            //Boton para actualizar los cambios
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 7.0),
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text(
                    "Actualizar cambios",
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Color.fromARGB(255, 159, 211, 170),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Gracias por ser parte de Cusco",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                child: Image.asset(
                  'assets/feliz.png',
                  scale: 1,
                )),
          )
        ],
      ),
    );
  }

  Widget _titulo() {
    return Card(
      color: Color.fromARGB(255, 182, 200, 236),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          children: [
            Text(
              "Ajustes",
              style: TextStyle(
                  color: Color.fromARGB(255, 19, 57, 121),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  fontFamily: 'Century Gothic'),
            )
          ],
        ),
      ),
    );
  }
}

class _Ajustes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CuscoStateDatos>(
        builder: (CuscoStateDatos cuscoStateDatos) {
      final _datos = cuscoStateDatos.datos[0];
      print(_datos);
      return Card(
        color: Color.fromARGB(255, 220, 229, 246),
        margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 15.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              Text("Modificar el limite de las personas:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: Color.fromARGB(255, 247, 143, 142),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _datos.limite!.toString(),
                                  style: TextStyle(fontSize: 40),
                                ),
                              ],
                            ),
                          ),
                          Text("Actual",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 247, 143, 142)))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: Color.fromARGB(255, 159, 211, 170),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 159, 211, 170))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 159, 211, 170)))),
                                ),
                              ],
                            ),
                          ),
                          Text("Nuevo",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 159, 211, 170)))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
