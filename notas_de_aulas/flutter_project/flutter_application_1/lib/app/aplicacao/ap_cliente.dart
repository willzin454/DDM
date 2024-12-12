import 'package:flutter_application_1/app/banco/sqlite/dao/dao_cliente.dart';
import 'package:flutter_application_1/app/dominio/cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';

class APCliente {
  late DAOCliente dao;
  late Cliente dominio;

  APCliente() {
    dao = DAOCliente();
    dominio = Cliente(dao: dao);
  }

  Future<DTOCliente> salvar(DTOCliente dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOCliente> alterar(DTOCliente dto) async {
    return await dominio.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    return await dominio.excluir(id);
  }

  Future<List<DTOCliente>> consultar() async {
    return await dominio.consultar();
  }
}