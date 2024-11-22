import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

abstract class IDAOVeiculo {
  Future<DTOVeiculo> salvar(DTOVeiculo dto);
  Future<DTOVeiculo> alterar(DTOVeiculo dto);
  Future<bool> excluir(String placa);
  Future<List<DTOVeiculo>> consultar();
}