import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_cliente.dart';
import 'package:flutter_application_1/app/dominio/cpf.dart' as validador;

class Cliente {
  dynamic _id;
  String? _nome;
  String? _cpf;
  String? _email;
  String? _descricao; // Atributo descricao adicionado
  String? _urlAvatar; // Atributo urlAvatar adicionado
  String _status = 'A';
  IDAOCliente dao;

  Cliente({required this.dao});

  // Validação dos dados recebidos no DTOCliente
  validar({required DTOCliente dto}) {
    nome = dto.nome;
    cpf = dto.cpf;
    email = dto.email;
    descricao = dto.descricao; // Atribuindo a descrição
    urlAvatar = dto.urlAvatar; // Atribuindo o URL do Avatar
    status = dto.status;

    // Validação de CPF usando o validador
    validador.CPF(cpf).eValido();
  }

  // Método para salvar um novo cliente
  Future<DTOCliente> salvar(DTOCliente dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  // Método para alterar os dados de um cliente existente
  Future<DTOCliente> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(_id);
  }

  // Método para excluir (alterar status) de um cliente
  Future<bool> excluir(dynamic id) async {
    this.id = id;
    await dao.alterarStatus(_id);
    return true;
  }

  // Método para consultar todos os clientes
  Future<List<DTOCliente>> consultar() async {
    return await dao.consultar();
  }

  // Getters e setters para acessar e modificar os atributos
  String? get nome => _nome;
  String? get cpf => _cpf;
  String? get email => _email;
  String? get descricao => _descricao; // Getter para descricao
  String? get urlAvatar => _urlAvatar; // Getter para urlAvatar
  String? get status => _status;

  set id(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo.');
    if (id < 0) throw Exception('ID não pode ser negativo.');
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio.');
    _nome = nome;
  }

  set cpf(String? cpf) {
    if (cpf == null) throw Exception('CPF não pode ser nulo.');
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio.');
    _cpf = cpf;
  }

  set email(String? email) {
    if (email == null) throw Exception('Email não pode ser nulo.');
    if (email.isEmpty) throw Exception('Email não pode ser vazio.');
    _email = email;
  }

  set descricao(String? descricao) {
    if (descricao == null) throw Exception('Descrição não pode ser nula.');
    _descricao = descricao;
  }

  set urlAvatar(String? urlAvatar) {
    if (urlAvatar == null) throw Exception('URL Avatar não pode ser nulo.');
    _urlAvatar = urlAvatar;
  }

  set status(String? status) {
    if (status == null) throw Exception('Status não pode ser nulo.');
    if (status != 'A' && status != 'I')
      throw Exception('Status deve ser "A" (ativo) ou "I" (inativo).');
    _status = status;
  }
}
