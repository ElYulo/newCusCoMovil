class CuscoModel {
  String? id;
  String? password;
  String? limite;
  String? fecha;
  String? hora;
  String? sensor;

  CuscoModel({
    this.id,
    this.password,
    this.limite,
    this.fecha,
    this.hora,
    this.sensor,
  });

  factory CuscoModel.fromMapJson(Map<String, dynamic> api) => CuscoModel(
        id: api['id'],
        password: api['password'],
        limite: api['limite'],
        fecha: api['fecha'],
        hora: api['hora'],
        sensor: api['sensor'],
      );
}
