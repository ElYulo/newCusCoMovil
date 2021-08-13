import 'package:cuscomovil/src/models/login_model.dart';
import 'package:cuscomovil/src/providers/login_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
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
  final _loginProvider = Get.find<LoginProvider>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginProvider.key,
      child: Container(
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
                  _inputPassword(_loginProvider.usuario),
                  FloatingActionButton.extended(
                      backgroundColor: Color.fromARGB(255, 159, 211, 170),
                      onPressed: () async {
                        if (!_loginProvider.checkValidator()) return;
                        final respuesta = await _loginProvider.login();
                        if (respuesta == null) {
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
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
      ),
    );
  }

  Widget _inputPassword(LoginModel usuario) {
    return TextFormField(
      onChanged: (data) {
        usuario.password = data;
      },
      validator: (data) {
        if (EmailValidator.validate(data!)) return null;
        //else
        //  return 'Contraseña no valida';
      },
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          labelText: 'Codigo de acceso', icon: Icon(Icons.lock)),
    );
  }
}
