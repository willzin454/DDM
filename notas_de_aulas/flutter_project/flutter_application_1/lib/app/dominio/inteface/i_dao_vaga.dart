import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';

abstract class IDAOVaga {
  Future<DTOVaga> salvar(DTOVaga dto);
  Future<DTOVaga> alterar(DTOVaga dto);
  Future<bool> excluir(int id);
  Future<List<DTOVaga>> consultar();
}