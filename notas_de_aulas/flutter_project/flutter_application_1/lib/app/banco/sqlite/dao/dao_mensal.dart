import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_mensal.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_mensal.dart';
import 'package:sqflite/sqflite.dart';

class DAOMensal implements IDAOMensal {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO mensal (clienteId, veiculoId, dataInicio, dataFim, valorMensal) 
    VALUES (?, ?, ?, ?, ?);
  ''';

  final sqlAlterar = '''
    UPDATE mensal 
    SET clienteId = ?, veiculoId = ?, dataInicio = ?, dataFim = ?, valorMensal = ? 
    WHERE id = ?;
  ''';

  final sqlExcluir = '''
    DELETE FROM mensal 
    WHERE id = ?;
  ''';

  final sqlConsultarPorId = '''
    SELECT * FROM mensal 
    WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM mensal;
  ''';

  @override
  Future<DTOMensal> salvar(DTOMensal dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.clienteId, dto.veiculoId, dto.dataInicio.toIso8601String(), dto.dataFim.toIso8601String(), dto.valorMensal]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOMensal> alterar(DTOMensal dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.clienteId, dto.veiculoId, dto.dataInicio.toIso8601String(), dto.dataFim.toIso8601String(), dto.valorMensal, dto.id]);
    return dto;
  }

  @override
  Future<DTOMensal> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOMensal mensal = DTOMensal(
      id: resultado['id'],
      clienteId: resultado['clienteId'],
      veiculoId: resultado['veiculoId'],
      dataInicio: DateTime.parse(resultado['dataInicio']),
      dataFim: DateTime.parse(resultado['dataFim']),
      valorMensal: resultado['valorMensal'],
    );
    return mensal;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    _db = await Conexao.iniciar();
    int count = await _db.rawDelete(sqlExcluir, [id]);
    return count > 0;
  }

  @override
  Future<List<DTOMensal>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOMensal> mensais = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOMensal(
        id: linha['id'],
        clienteId: linha['clienteId'],
        veiculoId: linha['veiculoId'],
        dataInicio: DateTime.parse(linha['dataInicio']),
        dataFim: DateTime.parse(linha['dataFim']),
        valorMensal: linha['valorMensal'],
      );
    });
    return mensais;
  }
}