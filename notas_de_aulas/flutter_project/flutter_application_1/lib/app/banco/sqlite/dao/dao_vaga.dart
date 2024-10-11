import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_vaga.dart';
import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class DAOVaga implements IDAOVaga {
  late Database _db;

  final String sqlInserir = '''
    INSERT INTO vaga (numero, tipo, ocupada)
    VALUES (?, ?, ?)
  ''';

  final String sqlAlterar = '''
    UPDATE vaga SET numero=?, tipo=?, ocupada=?
    WHERE id = ?
  ''';

  final String sqlExcluir = '''
    DELETE FROM vaga WHERE id = ?
  ''';

  final String sqlConsultarPorId = '''
    SELECT * FROM vaga WHERE id = ?;
  ''';

  final String sqlConsultar = '''
    SELECT * FROM vaga;
  ''';

  @override
  Future<DTOVaga> salvar(DTOVaga dto) async {
    _db = await Conexao.iniciar();
    int id = await _db
        .rawInsert(sqlInserir, [dto.numero, dto.tipo, dto.ocupada ? 1 : 0]);
    return DTOVaga(
        id: id, numero: dto.numero, tipo: dto.tipo, ocupada: dto.ocupada);
  }

  @override
  Future<DTOVaga> alterar(DTOVaga dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(
        sqlAlterar, [dto.numero, dto.tipo, dto.ocupada ? 1 : 0, dto.id]);
    return dto;
  }

  @override
  Future<bool> excluir(int id) async {
    _db = await Conexao.iniciar();
    int result = await _db.rawDelete(sqlExcluir, [id]);
    return result > 0;
  }

  Future<DTOVaga> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;

    return DTOVaga(
      id: resultado['id'] as int, 
      numero: resultado['numero'] as int,
      tipo: resultado['tipo'] as String,
      ocupada: resultado['ocupada'] == 1,
    );
  }

  @override
  Future<List<DTOVaga>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOVaga> vagas = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOVaga(
        id: linha['id'] as int,
        numero: linha['numero'] as int,
        tipo: linha['tipo'] as String,
        ocupada: linha['ocupada'] == 1, 
      );
    });
    return vagas;
  }

}