import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';

abstract class IDAOCliente {
  Future<DTOCliente> salvar(DTOCliente dto);
  Future<DTOCliente> alterar(DTOCliente dto);
  Future<bool> alterarStatus(dynamic id);
  Future<List<DTOCliente>> consultar();
  Future<DTOCliente> consultarPorId(dynamic id);
}
