import 'package:flutter_application_1/app/dominio/dto/dto_pagamento.dart';

abstract class IDAOPagamento {
  Future<DTOPagamento> salvar(DTOPagamento dto);
  Future<DTOPagamento> alterar(DTOPagamento dto);
  Future<bool> excluir(int id);
  Future<List<DTOPagamento>> consultar();
}