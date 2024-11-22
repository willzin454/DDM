import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';
import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class DAOVeiculo {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO veiculo (placa, modelo, marca, cor, ativo)
    VALUES (?, ?, ?, ?, ?)
  ''';

  final sqlAlterar = '''
    UPDATE veiculo SET modelo=?, marca=?, cor=?, ativo=?
    WHERE placa = ?
  ''';

  final sqlExcluir = '''
    DELETE FROM veiculo WHERE placa = ?
  ''';

  final sqlConsultar = '''
    SELECT * FROM veiculo;
  ''';

  Future<DTOVeiculo> salvar(DTOVeiculo dto) async {
    _db = await Conexao.iniciar();
    await _db.rawInsert(sqlInserir, [
      dto.placa,
      dto.modelo,
      dto.marca,
      dto.cor,
      dto.ativo ? 1 : 0,
    ]);
    return dto;
  }

  Future<DTOVeiculo> alterar(DTOVeiculo dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [
      dto.modelo,
      dto.marca,
      dto.cor,
      dto.ativo ? 1 : 0,
      dto.placa,
    ]);
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
        id: linha['id'] as int, // Convertendo explicitamente para int
        placa:
            linha['placa'] as String, // Convertendo explicitamente para String
        modelo: linha['modelo'] as String,
        marca: linha['marca'] as String,
        cor: linha['cor'] as String,
        ativo: (linha['ativo'] as int) == 1, // Convertendo int para bool
      );
    });
    return veiculos;
  }

}
