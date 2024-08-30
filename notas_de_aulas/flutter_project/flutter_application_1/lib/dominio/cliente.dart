import 'package:flutter_application_1/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/dominio/inteface/i_dao_cliente.dart';

class Cliente {
  late String nome;
  late String CPF;
  late String email;

  eNomeVazio() {
    if (nome.isEmpty) throw Exception("Nome não pode ser vazio!");
  }

  eCpfVazio() {
    if (CPF.isEmpty) throw Exception("CPF não pode ser vazio!");
  }

  eEmailVazio() {
    if (email.isEmpty) throw Exception("Email não pode ser vazio!");
  }
}
