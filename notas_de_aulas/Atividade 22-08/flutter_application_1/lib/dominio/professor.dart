import 'package:flutter_application_1/dominio/cpf.dart' as validador;
import 'package:flutter_application_1/dominio/dto/dto_professor.dart';
import 'package:flutter_application_1/dominio/interface/i_dao_professor.dart';

class Professor {
  late dynamic id;
  late String nome;
  late String? descricao;
  late String CPF;
  late String _status;
  String get status => _status;
  set status(String status) {
    if (status != "A" || status != "I")
      throw Exception('Status deve ser "A" ou "I".');
    _status = status;
  }

  late IDAOProfessor dao;
  late DTOProfessor dto;

  Professor({required this.dto, required this.dao}) {
    status = dto.status;
    validador.CPF(CPF);
  }

  eNomeNaoVazio() {
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio');
  }

  DTOProfessor salvar(DTOProfessor dto) {
    eNomeNaoVazio();
    return dao.salvar(dto);
  }
}
