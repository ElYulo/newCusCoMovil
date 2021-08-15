class CuscoModelDatos {
  String? id;

  int? limite;

  CuscoModelDatos({
    this.id,
    this.limite,
  });

  factory CuscoModelDatos.fromMapJson(Map<String, dynamic> api) =>
      CuscoModelDatos(
        id: api['id'],
        limite: api['limite'],
      );

  Map<String, dynamic> toJson() => {'id': id, 'limite': limite};
}
