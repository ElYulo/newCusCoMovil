class CuscoModelDatos {
  String? id;
  String? password;
  int? limite;

  CuscoModelDatos({
    this.id,
    this.password,
    this.limite,
  });

  factory CuscoModelDatos.fromMapJson(Map<String, dynamic> api) =>
      CuscoModelDatos(
        id: api['id'],
        password: api['password'],
        limite: api['limite'],
      );

  Map<String, dynamic> toJson() =>
      {'id': id, 'password': password, 'limite': limite};
}
