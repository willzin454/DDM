class Pessoa {
  dynamic id;
  String? nome;
  String? cpf;

  Pessoa({
    this.id,
    this.nome,
    this.cpf,
  });

  dynamic get getId => id;
  String? get getNome => nome;
  String? get getCpf => cpf;

  set setId(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo');
    if (id < 0) throw Exception('ID não pode ser negativo');
    this.id = id;
  }

  set setNome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio.');
    this.nome = nome;
  }

  set setCpf(String? cpf) {
    if (cpf == null) throw Exception('CPF não pode ser nulo.');
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio.');
    this.cpf = cpf;
  }

  void eNomeNaoVazio() {
    if (nome == null || nome!.isEmpty) throw Exception('Nome não pode ser vazio');
  }
}