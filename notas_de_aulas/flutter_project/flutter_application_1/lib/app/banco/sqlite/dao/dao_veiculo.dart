import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

class DAOVeiculo {
  late Database _db;

  final String sqlInserir = '''
    INSERT INTO veiculo (placa, modelo, cor)
    VALUES (?, ?, ?)
  ''';

  final String sqlAlterar = '''
    UPDATE veiculo SET modelo=?, cor=? WHERE placa=?
  ''';

  final String sqlExcluir = '''
    DELETE FROM veiculo WHERE placa=?
  ''';

  final String sqlConsultar = '''
    SELECT * FROM veiculo
  ''';

  Future<DTOVeiculo> salvar(DTOVeiculo dto) async {
    _db = await Conexao.iniciar();
    await _db.rawInsert(sqlInserir, [dto.placa, dto.modelo, dto.cor]);
    return dto;
  }

  Future<DTOVeiculo> alterar(DTOVeiculo dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [dto.modelo, dto.cor, dto.placa]);
    return dto;
  }

  Future<bool> excluir(String placa) async {
    _db = await Conexao.iniciar();
    int result = await _db.rawDelete(sqlExcluir, [placa]);
    return result > 0;
  }

  Future<List<DTOVeiculo>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOVeiculo> veiculos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOVeiculo(
        id: linha['id'],
        placa: linha['placa'].toString(),
        modelo: linha['modelo'].toString(),
        cor: linha['cor'].toString(),
      );
    });
    return veiculos;
  }
}