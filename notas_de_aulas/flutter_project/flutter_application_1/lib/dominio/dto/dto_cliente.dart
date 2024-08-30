class DTOCliente {
  late String nome;
  late String CPF;
  late String email;

  DTOCliente(this.nome, this.CPF, this.email);

  bool validarCPF() {
    return CPF.length == 11;
  }
}
