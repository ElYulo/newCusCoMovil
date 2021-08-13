import 'package:cuscomovil/src/pages/historial.dart';
import 'package:cuscomovil/src/pages/inicio.dart';
import 'package:cuscomovil/src/pages/inicio2.dart';
import 'package:cuscomovil/src/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _paginactual = 0;

  List<Widget> _paginas = [InicioPage(), HistorialPage(), Inicio2Page()];

  @override
  Widget build(BuildContext context) {
    final _loginProvider = Get.find<LoginProvider>();
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 182, 200, 236)),
                child: Center(
                    child: Text("Menu",
                        style: TextStyle(
                            fontSize: 40,
                            color: Color.fromARGB(255, 19, 57, 121))))),
            ListTile(
              leading:
                  Icon(Icons.settings_outlined, size: 30, color: Colors.black),
              title: Text(
                "Ajustes",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => Navigator.pushNamed(context, 'ajustes'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined,
                  size: 30, color: Colors.black),
              title: Text(
                "¿Cómo funciona?",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => Navigator.pushNamed(context, 'funcionamiento'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline, size: 30, color: Colors.black),
              title: Text(
                "Sobre Cusco",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => Navigator.pushNamed(context, 'sobrecusco'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, size: 30, color: Colors.black),
              title: Text(
                "Cerrar Sesion",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () async {
                await _loginProvider.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ),
      ),
      body: _paginas[_paginactual],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 220, 229, 246),
          onTap: (index) {
            setState(() {
              _paginactual = index;
            });
          },
          currentIndex: _paginactual,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pie_chart_outline_outlined,
                  color: Colors.black,
                ),
                label: "Graficas"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                label: "Historial"),
          ]),
    );
  }
}
