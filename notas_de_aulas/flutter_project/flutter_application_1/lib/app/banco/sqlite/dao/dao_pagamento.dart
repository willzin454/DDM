import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_pagamento.dart';

class DAOPagamento {
  late Database _db;

  final String sqlInserir = '''
    INSERT INTO pagamento (valor, data, id_registro)
    VALUES (?, ?, ?)
  ''';

  final String sqlAlterar = '''
    UPDATE pagamento SET valor=?, data=?, id_registro=? WHERE id=?
  ''';

  final String sqlExcluir = '''
    DELETE FROM pagamento WHERE id=?
  ''';

  final String sqlConsultar = '''
    SELECT * FROM pagamento
  ''';

  Future<DTOPagamento> salvar(DTOPagamento dto) async {
    _db = await Conexao.iniciar();
    await _db.rawInsert(
        sqlInserir, [dto.valor, dto.data.toIso8601String(), dto.idRegistro]);
    return dto;
  }

  Future<DTOPagamento> alterar(DTOPagamento dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.valor, dto.data.toIso8601String(), dto.idRegistro, dto.id]);
    return dto;
  }

  Future<bool> excluir(int id) async {
    _db = await Conexao.iniciar();
    int result = await _db.rawDelete(sqlExcluir, [id]);
    return result > 0;
  }

  Future<List<DTOPagamento>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);

    List<DTOPagamento> pagamentos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOPagamento(
        id: linha['id'] as int, 
        valor: (linha['valor'] as num).toDouble(),
        data:
            DateTime.parse(linha['data'] as String),
        idRegistro: linha['id_registro'] as int,
      );
    });
    return pagamentos;
  }
}