import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app/dominio/cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';

void main() {
  group("Cliente", () {
    test('Deve criar um cliente válido', () {
      final dto = DTOCliente(
        nome: "William Carvalho",
        cpf: "12345678998",
        email: "will@gmail.com",
        status: 'A',
      );

      final dao = DAOClienteFake();
      final cliente = Cliente(dto, dao: dao);

      expect(cliente.nome, equals('William Carvalho'));
      expect(cliente.cpf, equals('12345678998'));
      expect(cliente.email, equals('will@gmail.com'));
    });

    test('Deve lançar exceção para nome vazio', () {
      expect(
        () => Cliente(
          DTOCliente(
            nome: '',
            cpf: '12345678998',
            email: 'will@gmail.com',
            status: 'A',
          ),
          dao: DAOClienteFake(),
        ),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() == 'Exception: Nome não pode ser vazio')),
      );
    });

    test('Deve lançar exceção para CPF inválido', () {
      expect(
        () => Cliente(
          DTOCliente(
            nome: 'William Carvalho',
            cpf: '1234',
            email: 'will@gmail.com',
            status: 'A',
          ),
          dao: DAOClienteFake(),
        ),
        throwsA(predicate((e) =>
            e is Exception && e.toString() == 'Exception: CPF inválido')),
      );
    });

    test('Deve lançar exceção para status inválido', () {
      final cliente = Cliente(
        DTOCliente(
          nome: 'William Carvalho',
          cpf: '12345678998',
          email: 'will@gmail.com',
          status: 'A',
        ),
        dao: DAOClienteFake(),
      );

      expect(
        () => cliente.status = 'X', 
        throwsA(predicate((e) =>
            e is Exception && e.toString() == 'Exception: Status inválido')),
      );
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
  Future<DTOCliente> alterar(DTOCliente dto) async {
    return dto;
  }

  @override
  Future<bool> alterarStatus(dynamic id) async {
    return true;
  }

  @override
  Future<List<DTOCliente>> consultar() async {
    return [dtoSalvo];
  }

  @override
  Future<DTOCliente> consultarPorId(dynamic id) async {
    return dtoSalvo;
  }
}