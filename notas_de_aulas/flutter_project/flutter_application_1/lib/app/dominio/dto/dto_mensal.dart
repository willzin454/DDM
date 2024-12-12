class DTOMensal {
  late dynamic id;
  late dynamic clienteId;
  late dynamic veiculoId;
  late DateTime dataInicio;
  late DateTime dataFim;
  late double valorMensal;

  DTOMensal({
    this.id,
    required this.clienteId,
    required this.veiculoId,
    required this.dataInicio,
    required this.dataFim,
    required this.valorMensal,
  });

  set setId(dynamic id) {
    this.id = id;
  }
}