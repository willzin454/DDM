import 'package:flutter_application_1/app/dominio/dto/dto_mensal.dart';

abstract class IDAOMensal {
  Future<DTOMensal> salvar(DTOMensal dto);
  Future<DTOMensal> alterar(DTOMensal dto);
  Future<DTOMensal> consultarPorId(int id);
  Future<List<DTOMensal>> consultar();
  Future<bool> excluir(dynamic id);
}