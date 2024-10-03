import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';

abstract class IDAOCliente {
  Future<DTOCliente> salvar(DTOCliente dto); // Salvar um cliente
  Future<DTOCliente> alterar(DTOCliente dto); // Alterar os dados de um cliente
  Future<bool> alterarStatus(
      int id); // Alterar o status de um cliente (excluir/inativar)
  Future<DTOCliente> consultarPorId(int id); // Consultar um cliente pelo ID
  Future<List<DTOCliente>> consultar(); // Consultar todos os clientes
}
