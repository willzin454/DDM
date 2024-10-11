import 'package:flutter_application_1/app/banco/sqlite/dao/dao_vaga.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_vaga.dart';

class APVaga {
  late IDAOVaga dao;

  APVaga() {
    dao =
        DAOVaga(); 
  }

  Future<DTOVaga> salvarVaga(DTOVaga dto) async {
    return await dao.salvar(dto);
  }

  Future<List<DTOVaga>> consultar() async {
    return await dao.consultar(); 
  }

  Future<DTOVaga> alterarVaga(DTOVaga dto) async {
    return await dao.alterar(dto);
  }

  Future<bool> excluirVaga(int id) async {
    return await dao.excluir(id);
  }

  Future<DTOVaga> consultarPorId(int id) async {
    return await dao.consultarPorId(id);
  }
}