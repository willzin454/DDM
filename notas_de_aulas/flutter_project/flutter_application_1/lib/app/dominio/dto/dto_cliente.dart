class DTOCliente {
  dynamic id; 
  final String nome;
  final String? email;
  final String cpf;
  final String? descricao; 
  final String? urlAvatar;
  final String status;

  DTOCliente({
    this.id,
    required this.nome,
    this.email,
    required this.cpf,
    this.descricao,
    this.urlAvatar,
    this.status = 'A',
  });
}
