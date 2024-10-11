import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_veiculo.dart';

class Veiculo {
  dynamic _id;
  String? _placa;
  String? _modelo;
  String? _cor;
  IDAOVeiculo dao;

  Veiculo({required this.dao});

  validar({required DTOVeiculo dto}) {
    placa = dto.placa;
    modelo = dto.modelo;
    cor = dto.cor;

    if (placa == null || placa!.isEmpty) {
      throw Exception('Placa não pode ser nula ou vazia.');
    }

    if (modelo == null || modelo!.isEmpty) {
      throw Exception('Modelo não pode ser nulo ou vazio.');
    }

    if (cor == null || cor!.isEmpty) {
      throw Exception('Cor não pode ser nula ou vazia.');
    }
  }

  Future<DTOVeiculo> salvar(DTOVeiculo dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOVeiculo> alterar(dynamic id) async {
    this.id = id;
    return await dao.alterar(DTOVeiculo(
      id: _id,
      placa: placa!,
      modelo: modelo!,
      cor: cor!,
    ));
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return await dao.excluir(id);
  }

  Future<List<DTOVeiculo>> consultar() async {
    return await dao.consultar();
  }

  String? get placa => _placa;
  String? get modelo => _modelo;
  String? get cor => _cor;

  set id(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo.');
    if (id < 0) throw Exception('ID não pode ser negativo.');
    _id = id;
  }

  set placa(String? placa) {
    if (placa == null || placa.isEmpty) {
      throw Exception('Placa não pode ser vazia.');
    }
    _placa = placa;
  }

  set modelo(String? modelo) {
    if (modelo == null || modelo.isEmpty) {
      throw Exception('Modelo não pode ser vazio.');
    }
    _modelo = modelo;
  }

  set cor(String? cor) {
    if (cor == null || cor.isEmpty) {
      throw Exception('Cor não pode ser vazia.');
    }
    _cor = cor;
  }
}