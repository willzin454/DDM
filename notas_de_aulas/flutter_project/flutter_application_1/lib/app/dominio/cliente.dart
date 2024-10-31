import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';

class Cliente {
  dynamic id;
  String nome;
  String cpf;
  String? email;
  String? descricao;
  String? urlAvatar;
  String status;

  Cliente(DTOCliente dto, {required this.dao})
      : id = dto.id,
        nome = dto.nome,
        cpf = dto.cpf,
        email = dto.email,
        descricao = dto.descricao,
        urlAvatar = dto.urlAvatar,
        status = dto.status;

  final IDAOCliente dao;

  Future<DTOCliente> salvar() async {
    return await dao.salvar(
      DTOCliente(
        id: id,
        nome: nome,
        descricao: descricao,
        cpf: cpf,
        email: email,
        urlAvatar: urlAvatar,
        status: status,
      ),
    );
  }

  Future<DTOCliente> alterar() async {
    return await dao.alterar(
      DTOCliente(
        id: id,
        nome: nome,
        descricao: descricao,
        cpf: cpf,
        email: email,
        urlAvatar: urlAvatar,
        status: status,
      ),
    );
  }

  Future<bool> excluir() async {
    return await dao.alterarStatus(id);
  }

  Future<List<DTOCliente>> consultar() async {
    return await dao.consultar();
  }
}
