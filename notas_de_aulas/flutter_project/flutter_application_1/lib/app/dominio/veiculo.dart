import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_veiculo.dart';

class Veiculo {
  dynamic _id;
  String? _placa;
  String? _modelo;
  String? _marca;
  String? _cor;
  bool? _ativo;
  final IDAOVeiculo dao;

  Veiculo({required this.dao});

  void validar({required DTOVeiculo dto}) {
    id = dto.id;
    placa = dto.placa;
    modelo = dto.modelo;
    marca = dto.marca;
    cor = dto.cor;
    ativo = dto.ativo;

    if (placa == null || placa!.isEmpty) {
      throw Exception('Placa não pode ser nula ou vazia.');
    }

    if (modelo == null || modelo!.isEmpty) {
      throw Exception('Modelo não pode ser nulo ou vazio.');
    }

    if (marca == null || marca!.isEmpty) {
      throw Exception('Marca não pode ser nula ou vazia.');
    }

    if (cor == null || cor!.isEmpty) {
      throw Exception('Cor não pode ser nula ou vazia.');
    }
  }

  Future<DTOVeiculo> salvar(DTOVeiculo dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOVeiculo> alterar(DTOVeiculo dto) async {
    validar(dto: dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return await dao.excluir(id);
  }

  Future<List<DTOVeiculo>> consultar() async {
    return await dao.consultar();
  }

  dynamic get id => _id;
  String? get placa => _placa;
  String? get modelo => _modelo;
  String? get marca => _marca;
  String? get cor => _cor;
  bool? get ativo => _ativo;

  set id(dynamic id) {
    if (id == null) throw Exception('ID não pode ser nulo');
    if (id < 0) throw Exception('ID não pode ser negativo');
    _id = id;
  }

  set placa(String? placa) {
    if (placa == null) throw Exception('Placa não pode ser nula.');
    if (placa.isEmpty) throw Exception('Placa não pode ser vazia.');
    _placa = placa;
  }

  set modelo(String? modelo) {
    if (modelo == null) throw Exception('Modelo não pode ser nulo.');
    if (modelo.isEmpty) throw Exception('Modelo não pode ser vazio.');
    _modelo = modelo;
  }

  set marca(String? marca) {
    if (marca == null) throw Exception('Marca não pode ser nula.');
    if (marca.isEmpty) throw Exception('Marca não pode ser vazia.');
    _marca = marca;
  }

  set cor(String? cor) {
    if (cor == null) throw Exception('Cor não pode ser nula.');
    if (cor.isEmpty) throw Exception('Cor não pode ser vazia.');
    _cor = cor;
  }

  set ativo(bool? ativo) {
    _ativo = ativo;
  }
}