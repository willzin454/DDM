class DTOVeiculo {
  dynamic id;
  String placa;
  String modelo;
  String marca;
  String cor;
  bool ativo;

  DTOVeiculo({
    this.id,
    required this.placa,
    required this.modelo,
    required this.marca,
    required this.cor,
    this.ativo = true,
  });

  set setId(dynamic id) {
    this.id = id;
  }
}