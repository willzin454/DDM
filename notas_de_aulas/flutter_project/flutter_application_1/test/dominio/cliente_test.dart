import 'package:flutter_application_1/dominio/cliente.dart';
import 'package:flutter_application_1/dominio/inteface/i_dao_cliente.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/dominio/dto/dto_cliente.dart';

void main() {
  group("Cliente", () {
    test('Deve criar um cliente válido e salvar os dados', () {
      final dto =
          DTOCliente("William Carvalho", "12345678998", "will@gmial.com");
      final dao = DAOClienteFake();
      final cliente = Cliente(dto: dto, dao: dao);

      expect(cliente.nome, equals('William Carvalho'));
      expect(cliente.CPF, equals('12345678998'));
      expect(cliente.email, equals('will@gmial.com'));
      cliente.salvar();

      final dtoSalvo = dao.dtoSalvo;
      expect(dtoSalvo.nome, equals('William Carvalho'));
      expect(dtoSalvo.CPF, equals('12345678998'));
      expect(dtoSalvo.email, equals('will@gmial.com'));
    });
  });
}

class DAOClienteFake implements IDAOCliente {
  late DTOCliente dtoSalvo;

  @override
  DTOCliente salvar(DTOCliente dto) {
    dtoSalvo = dto;
    return dto;
  }
}