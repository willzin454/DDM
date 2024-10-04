import 'package:flutter_application_1/app/banco/sqlite/dao/dao_vaga.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_vaga.dart';

class APVaga {
  late IDAOVaga dao;

  APVaga() {
    dao = DAOVaga();
  }

  Future<DTOVaga> salvar(DTOVaga dto) async {
    return await dao.salvar(dto);
  }

  Future<DTOVaga> alterar(DTOVaga dto) async {
    return await dao.alterar(dto);
  }

  Future<bool> excluir(int id) async {
    return await dao.excluir(id);
  }

  Future<List<DTOVaga>> consultar() async {
    return await dao.consultar();
  }
}
