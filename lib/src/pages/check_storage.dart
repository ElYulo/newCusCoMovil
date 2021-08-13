import 'package:cuscomovil/src/models/login_model.dart';
import 'package:cuscomovil/src/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckStorage extends StatelessWidget {
  final _loginProvider = Get.put(LoginProvider());
  @override
  Widget build(BuildContext context) {
    _loginProvider.usuario = LoginModel(password: '');
    return Scaffold(
      body: FutureBuilder(
        future: _loginProvider.checkStorageToken(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text('Cargando....');
          if (snapshot.data != '') {
            Future.microtask(
              () => Navigator.pushReplacementNamed(context, '/'),
            );
          } else {
            Future.microtask(
              () => Navigator.pushReplacementNamed(context, 'login'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
