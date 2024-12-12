import 'package:flutter_application_1/app/banco/sqlite/dao/dao_veiculo.dart';
import 'package:flutter_application_1/app/dominio/veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

class APVeiculo {
  late DAOVeiculo dao;
  late Veiculo dominio;

  APVeiculo() {
    dao = DAOVeiculo();
    dominio = Veiculo(dao: dao);
  }

  Future<DTOVeiculo> salvar(DTOVeiculo dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOVeiculo> alterar(DTOVeiculo dto) async {
    return await dominio.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    return await dominio.excluir(id);
  }

  Future<List<DTOVeiculo>> consultar() async {
    return await dominio.consultar();
  }
}