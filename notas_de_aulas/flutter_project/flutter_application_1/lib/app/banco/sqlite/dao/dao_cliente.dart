import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';
import 'package:flutter_application_1/app/banco/sqlite/conexao.dart'; // Ajuste para seu caminho correto
import 'package:sqlite/sqlite.dart';

class DAOCliente implements IDAOCliente {
  late Database _db;

  // SQL para inserir um novo cliente
  final sqlInserir = '''
    INSERT INTO cliente (nome, descricao, CPF, url_avatar, status)
    VALUES (?,?,?,?,?)
  ''';

  // SQL para alterar um cliente existente
  final sqlAlterar = '''
    UPDATE cliente SET nome=?, descricao=?, CPF=?, url_avatar=?, status=?
    WHERE id = ?
  ''';

  // SQL para alterar o status do cliente (inativar)
  final sqlAlterarStatus = '''
    UPDATE cliente SET status='I'
    WHERE id = ?
  ''';

  // SQL para consultar um cliente por ID
  final sqlConsultarPorId = '''
    SELECT * FROM cliente WHERE id = ?;
  ''';

  // SQL para consultar todos os clientes
  final sqlConsultar = '''
    SELECT * FROM cliente;
  ''';

  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    _db = await Conexao.iniciar();
    int id = await _db.rawInsert(sqlInserir,
        [dto.nome, dto.descricao, dto.cpf, dto.urlAvatar, dto.status]);
    dto.id = id; // Define o ID do cliente após o salvamento
    return dto;
  }

  @override
  Future<bool> alterarStatus(int id) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterarStatus, [id]);
    return true;
  }

  @override
  Future<DTOCliente> alterar(DTOCliente dto) async {
    _db = await Conexao.iniciar();
    await _db.rawUpdate(sqlAlterar,
        [dto.nome, dto.descricao, dto.cpf, dto.urlAvatar, dto.status, dto.id]);
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
        cpf: resultado['CPF'].toString(),
        urlAvatar: resultado['url_avatar'].toString(),
        status: resultado['status'].toString());
    return cliente;
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
          cpf: linha['CPF'].toString(),
          urlAvatar: linha['url_avatar'].toString(),
          status: linha['status'].toString());
    });
    return clientes;
  }
}
