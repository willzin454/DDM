import 'package:flutter_application_1/app/banco/sqlite/dao_mensal.dart';
import 'package:flutter_application_1/app/dominio/mensal.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_mensal.dart';

class APMensal {
  late DAOMensal dao;
  late Mensal dominio;

  APMensal() {
    dao = DAOMensal();
    dominio = Mensal(dao: dao);
  }

  Future<DTOMensal> salvar(DTOMensal dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOMensal> alterar(DTOMensal dto) async {
    return await dominio.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    return await dominio.excluir(id);
  }

  Future<List<DTOMensal>> consultar() async {
    return await dominio.consultar();
  }
}