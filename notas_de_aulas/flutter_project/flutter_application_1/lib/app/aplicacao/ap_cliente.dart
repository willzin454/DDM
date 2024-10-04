import 'package:flutter_application_1/app/banco/sqlite/dao/dao_cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';
import 'package:flutter_application_1/app/dominio/cliente.dart';

class APCliente {
  late IDAOCliente dao;
  late Cliente dominio;

  APCliente() {
    dao = DAOCliente();
    dominio = Cliente(dao: dao);
  }

  Future<DTOCliente> salvar(DTOCliente dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOCliente> alterar(dynamic id) async {
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await dominio.excluir(id);
    return true;
  }

  Future<List<DTOCliente>> consultar() async {
    return await dominio.consultar();
  }
}
