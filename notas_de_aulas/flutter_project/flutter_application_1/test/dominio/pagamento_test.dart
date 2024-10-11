import 'package:flutter_application_1/app/dominio/pagamento.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_pagamento.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_pagamento.dart';

void main() {
  group("Pagamento", () {
    test('Deve criar um pagamento válido e salvar os dados', () async {
      final dto = DTOPagamento(
        id: 0,
        valor: 100.00,
        data: DateTime.now(),
        idRegistro: 1,
      );

      final dao = DAOPagamentoFake();
      final pagamento = Pagamento(dao: dao);

      pagamento.valor = dto.valor;
      pagamento.data = dto.data;
      pagamento.idRegistro = dto.idRegistro;

      expect(pagamento.valor, equals(100.00));
      expect(pagamento.idRegistro, equals(1));

      await pagamento.salvar(dto);

      final dtoSalvo = dao.dtoSalvo;
      expect(dtoSalvo.valor, equals(100.00));
      expect(dtoSalvo.idRegistro, equals(1));
    });
  });
}

class DAOPagamentoFake implements IDAOPagamento {
  late DTOPagamento dtoSalvo;

  @override
  Future<DTOPagamento> salvar(DTOPagamento dto) async {
    dtoSalvo = dto;
    return dto;
  }

  @override
  Future<DTOPagamento> alterar(DTOPagamento dto) async {
    return dto;
  }

  @override
  Future<bool> excluir(int id) async {
    return true;
  }

  @override
  Future<List<DTOPagamento>> consultar() async {
    return [];
  }
}