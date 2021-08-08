class CuscoModelDatos {
  String? password;
  int? limite;

  CuscoModelDatos({
    this.password,
    this.limite,
  });

  factory CuscoModelDatos.fromMapJson(Map<String, dynamic> api) =>
      CuscoModelDatos(
        password: api['password'],
        limite: api['limite'],
      );
}
