class CuscoModel {
  String? id;
  String? fecha;
  String? hora;
  String? sensor;

  CuscoModel({
    this.id,
    this.fecha,
    this.hora,
    this.sensor,
  });

  factory CuscoModel.fromMapJson(Map<String, dynamic> api) => CuscoModel(
        id: api['id'],
        fecha: api['fecha'],
        hora: api['hora'],
        sensor: api['sensor'],
      );
}
