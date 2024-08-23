import 'package:flutter_application_1/dominio/dto/dto_professor.dart';
import 'package:flutter_application_1/dominio/professor.dart';
import 'package:flutter_application_1/dominio/interface/i_dao_professor.dart';

main() {
  var dto = DTOProfessor(nome: 'João', cpf: '100.111.111-74');
  var dao = DAOProfessorFake();
  var professor = Professor(dto: dto, dao: dao);

}
  class DAOProfessorFake implements IDAOProfessor{
    @override
    DTOProfessor salvar(DTOProfessor dto){
      return dto;
    }
  }