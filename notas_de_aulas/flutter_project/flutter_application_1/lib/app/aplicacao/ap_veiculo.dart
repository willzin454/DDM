import 'package:flutter_application_1/app/banco/sqlite/dao/dao_veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

class APVeiculo {
  final DAOVeiculo dao = DAOVeiculo();

  Future<DTOVeiculo> salvarVeiculo(DTOVeiculo dto) async {
    return await dao.salvar(dto);
  }

  Future<DTOVeiculo> alterarVeiculo(DTOVeiculo dto) async {
    return await dao.alterar(dto);
  }

  Future<bool> excluirVeiculo(String placa) async {
    return await dao.excluir(placa);
  }

  Future<List<DTOVeiculo>> consultarVeiculos() async {
    return await dao.consultar();
  }
}