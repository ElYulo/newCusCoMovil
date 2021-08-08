import 'package:cuscomovil/src/pages/ajustes.dart';
import 'package:cuscomovil/src/pages/funcionamiento.dart';
import 'package:cuscomovil/src/pages/historial.dart';
import 'package:cuscomovil/src/pages/historialEntrada.dart';
import 'package:cuscomovil/src/pages/historialSalida.dart';
import 'package:cuscomovil/src/pages/home.dart';
import 'package:cuscomovil/src/pages/login.dart';
import 'package:cuscomovil/src/pages/sobre_cusco.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryIconTheme:
              IconThemeData(color: Color.fromARGB(255, 19, 57, 121)),
          fontFamily: 'Century Gothic'),
      title: 'Cusco',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        'login': (_) => LoginPage(),
        'funcionamiento': (_) => FuncionamientoPage(),
        'sobrecusco': (_) => SobreCuscoPage(),
        'ajustes': (_) => AjustesPage(),
        'historial': (_) => HistorialPage(),
        'historialEntrada': (_) => HistorialPageEntrada(),
        'historialSalida': (_) => HistorialPageSalida(),
        '/': (_) => HomePage()
      },
    );
  }
}
