import 'package:flutter_application_1/app/banco/sqlite/conexao.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';
import 'package:sqflite/sqflite.dart';

class DAOCliente implements IDAOCliente {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO cliente (nome, descricao, cpf, email, status) 
    VALUES (?, ?, ?, ?, ?);
  ''';

  final sqlAlterar = '''
    UPDATE cliente 
    SET nome = ?, descricao = ?, cpf = ?, email = ?, status = ? 
    WHERE id = ?;
  ''';

  final sqlAlterarStatus = '''
    UPDATE cliente 
    SET status = NOT status 
    WHERE id = ?;
  ''';

  final sqlExcluir = '''
    DELETE FROM cliente 
    WHERE id = ?;
  ''';

  final sqlConsultarPorId = '''
    SELECT * FROM cliente 
    WHERE id = ?;
  ''';

  final sqlConsultar = '''
    SELECT * FROM cliente;
  ''';

  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.nome, dto.descricao, dto.cpf, dto.email, dto.status ? 1 : 0]);
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOCliente> alterar(DTOCliente dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.nome, dto.descricao, dto.cpf, dto.email, dto.status ? 1 : 0, dto.id]);
    return dto;
  }

  @override
  Future<DTOCliente> consultarPorId(int id) async {
    _db = await Conexao.iniciar();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOCliente cliente = DTOCliente(
      id: resultado['id'],
      nome: resultado['nome'].toString(),
      descricao: resultado['descricao'].toString(),
      cpf: resultado['cpf'].toString(),
      email: resultado['email'].toString(),
      status: resultado['status'] == 1,
    );
    return cliente;
  }

  @override
  Future<bool> excluir(dynamic id) async {
    _db = await Conexao.iniciar();
    int count = await _db.rawDelete(sqlExcluir, [id]);
    return count > 0;
  }

  @override
  Future<List<DTOCliente>> consultar() async {
    _db = await Conexao.iniciar();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOCliente> clientes = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOCliente(
        id: linha['id'],
        nome: linha['nome'].toString(),
        descricao: linha['descricao'].toString(),
        cpf: linha['cpf'].toString(),
        email: linha['email'].toString(),
        status: linha['status'] == 1,
      );
    });
    return clientes;
  }
}