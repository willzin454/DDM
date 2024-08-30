import 'package:flutter_application_1/dominio/cliente.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/dominio/dto/dto_cliente.dart';

void main() {
  group("Cliente", () {
    test('Deve criar um cliente válido', () {
      final cliente =
          DTOCliente("William Carvalho", "12345678998", "will@gmial.com");

      expect(cliente.nome, equals('William Carvalho'));
      expect(cliente.CPF, equals('12345678998'));
      expect(cliente.email, equals('will@gmial.com'));
    });

    test("Validar CPF!", () {
      final cliente =
          DTOCliente("William Carvalho", "12345678998", "will@gmial.com");

      expect(cliente.validarCPF(), isTrue);

      final clienteInvalido =
          DTOCliente("William Carvalho", "1234567", "will@gmial.com");

      expect(clienteInvalido.validarCPF(), isFalse);
    });
  });
}
