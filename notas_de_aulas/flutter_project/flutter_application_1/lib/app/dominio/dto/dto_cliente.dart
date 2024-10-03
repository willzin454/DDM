class DTOCliente {
  dynamic id; // Pode ser nulo para novos registros
  final String nome;
  final String? email; // Campo opcional
  final String cpf;
  final String? descricao; // Campo opcional para descrição adicionado
  final String? urlAvatar; // Campo opcional para URL do avatar adicionado
  final String status;

  // Construtor com valores padrão e atributos obrigatórios
  DTOCliente({
    this.id,
    required this.nome,
    this.email,
    required this.cpf,
    this.descricao, // Atribuindo a descrição
    this.urlAvatar, // Atribuindo o URL do Avatar
    this.status = 'A', // Padrão para 'A' (ativo)
  });
}
