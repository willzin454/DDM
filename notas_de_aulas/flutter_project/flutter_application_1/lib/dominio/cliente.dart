import 'package:flutter_application_1/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/dominio/inteface/i_dao_cliente.dart';

class Cliente {
  late String nome;
  late String CPF;
  late String email;
  final IDAOCliente dao;

  Cliente({required DTOCliente dto, required this.dao}) {
    this.nome = dto.nome;
    this.CPF = dto.CPF;
    this.email = dto.email;

    // Validações usando métodos internos
    eNomeVazio();
    eCpfVazio();
    eEmailVazio();
  }

  void salvar() {
    // Use o DAO para salvar o DTO
    dao.salvar(DTOCliente(nome, CPF, email));
  }

  void eNomeVazio() {
    if (nome.isEmpty) throw Exception("Nome não pode ser vazio!");
  }

  void eCpfVazio() {
    if (CPF.isEmpty) throw Exception("CPF não pode ser vazio!");
  }

  void eEmailVazio() {
    if (email.isEmpty) throw Exception("Email não pode ser vazio!");
  }
}
