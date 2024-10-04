import 'package:flutter_application_1/app/dominio/cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/banco/sqlite/dao/dao_cliente.dart';

void main() {
  group("Cliente", () {
    test('Deve criar um cliente válido e salvar os dados', () async {
      final dto = DTOCliente(
          nome: "William Carvalho",
          cpf: "12345678998",
          email: "will@gmial.com",
          status: 'A'
          );

      final dao = DAOClienteFake();
      final cliente = Cliente(dao: dao);

      cliente.nome = dto.nome;
      cliente.cpf = dto.cpf;
      cliente.email = dto.email;

      expect(cliente.nome, equals('William Carvalho'));
      expect(cliente.cpf, equals('12345678998'));
      expect(cliente.email, equals('will@gmial.com'));

      await cliente.salvar(dto);

      final dtoSalvo = dao.dtoSalvo;
      expect(dtoSalvo.nome, equals('William Carvalho'));
      expect(dtoSalvo.cpf, equals('12345678998'));
      expect(dtoSalvo.email, equals('will@gmial.com'));
    });
  });
}

class DAOClienteFake implements IDAOCliente {
  late DTOCliente dtoSalvo;

  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    dtoSalvo = dto;
    return dto;
  }

  @override
  Future<bool> alterarStatus(int id) async {
    return true;
  }

  @override
  Future<DTOCliente> alterar(DTOCliente dto) async {
    return dto; 
  }

  @override
  Future<DTOCliente> consultarPorId(int id) async {
    throw UnimplementedError(); 
  }

  @override
  Future<List<DTOCliente>> consultar() async {
    return []; 
  }
}