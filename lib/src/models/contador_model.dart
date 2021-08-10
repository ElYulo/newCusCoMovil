class ContadorModel {
  String? id;
  String? contador;
  ContadorModel({this.id, this.contador});
  factory ContadorModel.fromMapJson(Map<String, dynamic> api) => ContadorModel(
        id: api['id'],
        contador: api['contador'],
      );
}
