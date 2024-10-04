import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_vaga.dart';
import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class DAOVaga implements IDAOVaga {
  late Database _db;

  // Comandos SQL para manipulação de dados
  final sqlInserir = '''
    INSERT INTO vaga (numero, ocupada)
    VALUES (?, ?)
  ''';

  final sqlAlterar = '''
    UPDATE vaga SET numero=?, ocupada=?
    WHERE id = ?
  ''';

  final sqlExcluir = '''
    DELETE FROM vaga WHERE id = ?
  ''';

  final sqlConsultarPorId = '''
    SELECT * FROM vaga WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM vaga;
  ''';

  @override
  Future<DTOVaga> salvar(DTOVaga dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir, [dto.numero, dto.ocupada ? 1 : 0]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOVaga> alterar(DTOVaga dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar, [dto.numero, dto.ocupada ? 1 : 0, dto.id]);
    return dto;
  }

  @override
  Future<bool> excluir(int id) async {
    _db = await Conexao.iniciar();
    await _db.rawDelete(sqlExcluir, [id]);
    return true;
  }

  @override
  Future<DTOVaga> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOVaga vaga = DTOVaga(
      id: resultado['id'],
      numero: resultado['numero'].toString(),
      ocupada: resultado['ocupada'] == 1, // 1 para true, 0 para false
    );
    return vaga;
  }

  @override
  Future<List<DTOVaga>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOVaga> vagas = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOVaga(
        id: linha['id'],
        numero: linha['numero'].toString(),
        ocupada: linha['ocupada'] == 1, // 1 para true, 0 para false
      );
    });
    return vagas;
  }
}
