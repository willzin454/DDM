import 'package:flutter_application_1/app/dominio/dto/dto_pagamento.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_pagamento.dart';

class Pagamento {
  dynamic _id;
  double? _valor;
  DateTime? _data;
  int? _idRegistro;
  IDAOPagamento dao;

  Pagamento({required this.dao});

  validar({required DTOPagamento dto}) {
    valor = dto.valor;
    data = dto.data;
    idRegistro = dto.idRegistro;

    if (valor == null || valor! <= 0) {
      throw Exception('Valor não pode ser nulo ou menor que zero.');
    }

    if (data == null) {
      throw Exception('Data não pode ser nula.');
    }

    if (idRegistro == null || idRegistro! <= 0) {
      throw Exception('ID de registro não pode ser nulo ou menor que zero.');
    }
  }

  Future<DTOPagamento> salvar(DTOPagamento dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOPagamento> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(DTOPagamento(
      id: _id,
      valor: valor!,
      data: data!,
      idRegistro: idRegistro!,
    ));
  }
  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return await dao.excluir(id);
  }

  Future<List<DTOPagamento>> consultar() async {
    return await dao.consultar();
  }

  double? get valor => _valor;
  DateTime? get data => _data;
  int? get idRegistro => _idRegistro;

  set id(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo.');
    if (id < 0) throw Exception('ID não pode ser negativo.');
    _id = id;
  }

  set valor(double? valor) {
    if (valor == null || valor <= 0) {
      throw Exception('Valor não pode ser menor ou igual a zero.');
    }
    _valor = valor;
  }

  set data(DateTime? data) {
    if (data == null) throw Exception('Data não pode ser nula.');
    _data = data;
  }

  set idRegistro(int? idRegistro) {
    if (idRegistro == null || idRegistro <= 0) {
      throw Exception('ID de registro não pode ser nulo ou menor que zero.');
    }
    _idRegistro = idRegistro;
  }
}