import 'package:flutter_application_1/app/banco/sqlite/dao/dao_pagamento.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_pagamento.dart';

class APPagamento {
  final DAOPagamento dao = DAOPagamento();

  Future<DTOPagamento> salvarPagamento(DTOPagamento dto) async {
    return await dao.salvar(dto);
  }

  Future<DTOPagamento> alterarPagamento(DTOPagamento dto) async {
    return await dao.alterar(dto);
  }

  Future<bool> excluirPagamento(int id) async {
    return await dao.excluir(id);
  }

  Future<List<DTOPagamento>> consultarPagamentos() async {
    return await dao.consultar();
  }
}