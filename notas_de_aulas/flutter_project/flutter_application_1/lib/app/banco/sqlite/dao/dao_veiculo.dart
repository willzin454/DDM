import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';
import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_veiculo.dart';
import 'package:sqflite/sqflite.dart';

class DAOVeiculo implements IDAOVeiculo {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO veiculo (placa, modelo, marca, cor, ativo)
    VALUES (?, ?, ?, ?, ?)
  ''';

  final sqlAlterar = '''
    UPDATE veiculo SET modelo=?, marca=?, cor=?, ativo=?
    WHERE id = ?
  ''';

  final sqlExcluir = '''
    DELETE FROM veiculo WHERE id = ?
  ''';

  final sqlConsultarPorId = '''
    SELECT * FROM veiculo WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM veiculo;
  ''';

  @override
  Future<DTOVeiculo> salvar(DTOVeiculo dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [
      dto.placa,
      dto.modelo,
      dto.marca,
      dto.cor,
      dto.ativo ? 1 : 0
    ]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOVeiculo> alterar(DTOVeiculo dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [
      dto.modelo,
      dto.marca,
      dto.cor,
      dto.ativo ? 1 : 0,
      dto.id
    ]);
    return dto;
  }

  @override
  Future<DTOVeiculo> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOVeiculo veiculo = DTOVeiculo(
      id: resultado['id'],
      placa: resultado['placa'],
      modelo: resultado['modelo'],
      marca: resultado['marca'],
      cor: resultado['cor'],
      ativo: resultado['ativo'] == 1,
    );
    return veiculo;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    _db = await Conexao.iniciar();
    int count = await _db.rawDelete(sqlExcluir, [id]);
    return count > 0;
  }

  @override
  Future<List<DTOVeiculo>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOVeiculo> veiculos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOVeiculo(
        id: linha['id'],
        placa: linha['placa'],
        modelo: linha['modelo'],
        marca: linha['marca'],
        cor: linha['cor'],
        ativo: linha['ativo'] == 1,
      );
    });
    return veiculos;
  }
}