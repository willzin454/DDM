import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

abstract class IDAOVeiculo {
  Future<DTOVeiculo> salvar(DTOVeiculo dto);
  Future<DTOVeiculo> alterar(DTOVeiculo dto);
  Future<DTOVeiculo> consultarPorId(int id);
  Future<List<DTOVeiculo>> consultar();
  Future<bool> excluir(dynamic id);
}