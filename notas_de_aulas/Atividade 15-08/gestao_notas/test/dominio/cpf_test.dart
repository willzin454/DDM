import 'package:flutter_application_1/dominio/cpf.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Entidade CPF; ', () {
    group("teste de CPF vazio; ", () {
      test('Entidade CPF - teste com cpf sem ser vazio', () {
        expect(() => CPF('076.010.469-74'), returnsNormally);
      });
      test('Entidade CPF - teste com cpf vazio', () {
        expect(() => CPF(''), throwsException);
      });
      test('[e04] CPF - teste CPF com 11 números', () {
        expect(() => CPF('076.010.469-74').eOnzeNumeros(), returnsNormally);
      });
      test('[e04] CPF - teste CPF com 10 números', () {
        expect(() => CPF('076.010.469-7').eOnzeNumeros(), throwsException);
      });
      test('[e04] CPF - teste CPF com 12 números', () {
        expect(() => CPF('076.010.469-744').eOnzeNumeros(), throwsException);
      });
      test('CPF - teste de numeros diferentes', () {
        expect(() => CPF('012.345.678-99').eNumeroDiferentes(), true);
      });
      test('CPF - teste de numeros iguais', () {
        expect(() => CPF('111.111.111-11').eNumeroDiferentes(), false);
      });
    });
  });
}
