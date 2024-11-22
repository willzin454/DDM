class DTOVeiculo {
  dynamic id;
  String placa;
  String modelo;
  String marca; // Adicionei a marca
  String cor; // Já está aqui
  bool ativo; // Adicionei o ativo

  DTOVeiculo({
    this.id,
    required this.placa,
    required this.modelo,
    required this.marca, // Agora a marca está definida
    required this.cor,
    this.ativo = true, // Campo ativo com valor padrão
  });
}
