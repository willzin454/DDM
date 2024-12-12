class DTOCliente {
  int? id;
  final String nome;
  final String descricao;
  final String cpf;
  final bool status;

  DTOCliente({
    this.id,
    required this.nome,
    required this.descricao,
    required this.cpf,
    required this.status,
  });
}