import 'package:flutter_application_1/app/dominio/dto/dto_funcionario.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_funcionario.dart';

class Funcionario {
  dynamic _id;
  String? _nome;
  String? _email;
  int? _idade;
  String? _numeroTelefone;
  String? _cpf;
  String? _senha;
  String? _cargo;
  final IDAOFuncionario dao;

  Funcionario({required this.dao});

  void validar({required DTOFuncionario dto}) {
    nome = dto.nome;
    email = dto.email;
    idade = dto.idade;
    cpf = dto.cpf;
    senha = dto.senha;
    numeroTelefone = dto.numeroTelefone;
    cargo = dto.cargo;
  }

  Future<DTOFuncionario> salvar(DTOFuncionario dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOFuncionario> alterar(DTOFuncionario dto) async {
    validar(dto: dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return await dao.excluir(id);
  }

  Future<List<DTOFuncionario>> consultar() async {
    return await dao.consultar();
  }

  String? get nome => _nome;
  String? get email => _email;
  int? get idade => _idade;
  String? get cpf => _cpf;
  String? get numeroTelefone => _numeroTelefone;
  String? get senha => _senha;
  String? get cargo => _cargo;

  set id(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo');
    if (id < 0) throw Exception('ID não pode ser negativo');
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null) throw Exception('Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio.');
    _nome = nome;
  }

  set idade(int? idade) {
    if (idade == null) throw Exception('Idade não pode ser nulo.');
    _idade = idade;
  }

  set email(String? email) {
    if (email == null) throw Exception('Email não pode ser nulo.');
    _email = email;
  }

  set cpf(String? cpf) {
    if (cpf == null) throw Exception('CPF não pode ser nulo.');
    if (cpf.isEmpty) throw Exception('CPF não pode ser vazio.');
    _cpf = cpf;
  }

  set numeroTelefone(String? numeroTelefone) {
    if (numeroTelefone == null) throw Exception('Numero de telefone não pode ser nulo.');
    _numeroTelefone = numeroTelefone;
  }

  set senha(String? senha) {
    if (senha == null) throw Exception('Senha não pode ser nulo.');
    _senha = senha;
  }

  set cargo(String? cargo) {
    if (cargo == null) throw Exception('Cargo não pode ser nulo.');
    _cargo = cargo;
  }

  static bool validarSenha(String senha) {
    if (senha.isEmpty) {
      return false;
    }

    bool temLetraMaiuscula = senha.contains(RegExp(r'[A-Z]'));
    bool temLetraMinuscula = senha.contains(RegExp(r'[a-z]'));
    bool temNumeros = senha.contains(RegExp(r'[0-9]'));
    bool temCaractereEspecial = senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>-_]'));
    bool temTamanhoMinimo = senha.length >= 8;

    return temLetraMaiuscula &&
        temLetraMinuscula &&
        temNumeros &&
        temCaractereEspecial &&
        temTamanhoMinimo;
  }
}