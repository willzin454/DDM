import 'package:flutter_application_1/app/banco/sqlite/dao/dao_cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';
import 'package:flutter_application_1/app/dominio/cliente.dart';

class APCliente {
  late IDAOCliente dao;

  APCliente() {
    dao = DAOCliente();
  }

  Future<DTOCliente> salvar(DTOCliente dto) async {
    final cliente = Cliente(dto, dao: dao);
    return await cliente.salvar();
  }

  Future<DTOCliente> alterar(DTOCliente dto) async {
    final cliente = Cliente(dto, dao: dao);
    return await cliente.alterar();
  }

  Future<bool> excluir(dynamic id) async {
    return await dao.alterarStatus(id);
  }

  Future<List<DTOCliente>> consultar() async {
    return await dao.consultar();
  }
}
