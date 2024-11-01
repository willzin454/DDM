import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app/dominio/veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_veiculo.dart';

void main() {
  group("Veiculo", () {
    test('Deve criar um veículo válido', () {
      final dto = DTOVeiculo(
        placa: "ABC1234",
        modelo: "Ford Focus",
        cor: "Preto",
      );

      final dao = DAOVeiculoFake();
      final veiculo = Veiculo(dao: dao);
      veiculo.validar(dto: dto);

      expect(veiculo.placa, equals('ABC1234'));
      expect(veiculo.modelo, equals('Ford Focus'));
      expect(veiculo.cor, equals('Preto'));
    });

    test('Deve lançar exceção para placa vazia', () {
      expect(
        () => Veiculo(dao: DAOVeiculoFake())
          ..validar(
              dto: DTOVeiculo(placa: '', modelo: 'Ford Focus', cor: 'Preto')),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() == 'Exception: Placa não pode ser vazia.')),
      );
    });

    test('Deve lançar exceção para modelo vazio', () {
      expect(
        () => Veiculo(dao: DAOVeiculoFake())
          ..validar(
              dto: DTOVeiculo(placa: 'ABC1234', modelo: '', cor: 'Preto')),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() == 'Exception: Modelo não pode ser vazio.')),
      );
    });

    test('Deve lançar exceção para cor vazia', () {
      expect(
        () => Veiculo(dao: DAOVeiculoFake())
          ..validar(
              dto: DTOVeiculo(placa: 'ABC1234', modelo: 'Ford Focus', cor: '')),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString() == 'Exception: Cor não pode ser vazia.')),
      );
    });

    test('Deve salvar um veículo e validar os dados salvos', () async {
      final dto = DTOVeiculo(
        placa: "ABC1234",
        modelo: "Ford Focus",
        cor: "Preto",
      );

      final dao = DAOVeiculoFake();
      final veiculo = Veiculo(dao: dao);

      await veiculo.salvar(dto);

      final dtoSalvo = dao.dtoSalvo;
      expect(dtoSalvo.placa, equals('ABC1234'));
      expect(dtoSalvo.modelo, equals('Ford Focus'));
      expect(dtoSalvo.cor, equals('Preto'));
    });
  });
}

class DAOVeiculoFake implements IDAOVeiculo {
  late DTOVeiculo dtoSalvo;

  @override
  Future<DTOVeiculo> salvar(DTOVeiculo dto) async {
    dtoSalvo = dto;
    return dto;
  }

  @override
  Future<DTOVeiculo> alterar(DTOVeiculo dto) async {
    return dto;
  }

  @override
  Future<bool> excluir(String placa) async {
    return true;
  }

  @override
  Future<List<DTOVeiculo>> consultar() async {
    return [];
  }
}