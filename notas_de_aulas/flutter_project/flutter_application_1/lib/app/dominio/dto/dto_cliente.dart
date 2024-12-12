class DTOCliente {
  int? id;
  final String nome;
  final String descricao;
  final String cpf;
  final String email;
  final bool status;

  DTOCliente({
    this.id,
    required this.nome,
    required this.descricao,
    required this.cpf,
    required this.email,
    required this.status,
  });

  set setId(int id) {
    this.id = id;
  }
}