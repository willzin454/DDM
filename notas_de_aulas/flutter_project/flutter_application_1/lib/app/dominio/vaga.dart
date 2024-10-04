import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_vaga.dart';

class Vaga {
  dynamic _id;
  String? _numero; 
  bool _ocupada;
  IDAOVaga dao;

  Vaga({required this.dao, bool ocupada = false}) : _ocupada = ocupada;

  void validar({required DTOVaga dto}) {
    numero = dto.numero;
    _ocupada = dto.ocupada;
  }

  Future<DTOVaga> salvar(DTOVaga dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOVaga> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return await dao.excluir(_id);
  }

  Future<List<DTOVaga>> consultar() async {
    return await dao.consultar();
  }

  String? get numero => _numero;
  bool get ocupada => _ocupada;

  set id(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo.');
    if (id < 0) throw Exception('ID não pode ser negativo.');
    _id = id;
  }

  set numero(String? numero) {
    if (numero == null) throw Exception('Número da vaga não pode ser nulo.');
    if (numero.isEmpty) throw Exception('Número da vaga não pode ser vazio.');
    _numero = numero;
  }

  set ocupada(bool ocupada) {
    _ocupada = ocupada;
  }
}
