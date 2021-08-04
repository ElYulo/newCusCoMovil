import 'package:cuscomovil/src/providers/cusco_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  @override
  void initState() {
    final cuscoState = Get.put(CuscoState());
    cuscoState.obtenerDatos();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            _Login(),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 150.00),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            color: Color.fromARGB(255, 220, 229, 246),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 7),
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/cusco.png',
                        scale: 10.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("CusCO",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(
                  height: 15,
                ),
                Text("Ingrese su código de acceso:",
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                _InputPassword(),
                FloatingActionButton.extended(
                    backgroundColor: Color.fromARGB(255, 159, 211, 170),
                    onPressed: () {},
                    label: Text(
                      "Iniciar sesión",
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Encaso de no saber su codigo de acceso"),
          Text("comunicarlo a su administrador.")
        ],
      ),
    );
  }
}

class _InputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 185, 191, 201),
          borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            suffixIcon: Icon(Icons.lock),
            labelText: 'Código de acceso',
            fillColor: Colors.black),
      ),
    );
  }
}
