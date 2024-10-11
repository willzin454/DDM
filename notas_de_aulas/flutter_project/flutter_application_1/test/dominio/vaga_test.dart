import 'package:flutter_application_1/app/dominio/vaga.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_vaga.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';

void main() {
  group("Vaga", () {
    test('Deve criar uma vaga válida e salvar os dados', () async {
      final dto = DTOVaga(
        id: 0, 
        numero: 1,
        tipo: "Normal", 
        ocupada: false,
      );

      final dao = DAOVagaFake();
      final vaga = Vaga(dao: dao);

      vaga.numero =
          dto.numero.toString();
      vaga.ocupada = dto.ocupada;

      expect(vaga.numero, equals('1')); 
      expect(vaga.ocupada, equals(false));

      await vaga.salvar(dto);

      final dtoSalvo = dao.dtoSalvo;
      expect(dtoSalvo.numero,
          equals(1));
      expect(dtoSalvo.ocupada, equals(false));
    });
  });
}

class DAOVagaFake implements IDAOVaga {
  late DTOVaga dtoSalvo;

  @override
  Future<DTOVaga> salvar(DTOVaga dto) async {
    dtoSalvo = dto;
    return dto;
  }

  @override
  Future<DTOVaga> alterar(DTOVaga dto) async {
    return dto;
  }

  @override
  Future<bool> excluir(int id) async {
    return true;
  }

  @override
  Future<List<DTOVaga>> consultar() async {
    return [];
  }

  @override
  Future<DTOVaga> consultarPorId(int id) async {
    throw UnimplementedError();
  }
}