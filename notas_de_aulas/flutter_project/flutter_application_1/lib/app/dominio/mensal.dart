import 'package:flutter_application_1/app/banco/sqlite/dao_veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_mensal.dart';
import 'package:flutter_application_1/app/dominio/inteface/i_dao_mensal.dart';

class Mensal {
  dynamic _id;
  dynamic? _clienteId;
  dynamic? _veiculoId;
  DateTime? _dataInicio;
  DateTime? _dataFim;
  double? _valorMensal;
  IDAOMensal dao;

  Mensal({required this.dao});

  void validar({required DTOMensal dto}) {
    clienteId = dto.clienteId;
    veiculoId = dto.veiculoId;
    dataInicio = dto.dataInicio;
    dataFim = dto.dataFim;
    valorMensal = dto.valorMensal;
  }

  Future<DTOMensal> salvar(DTOMensal dto) async {
    validar(dto: dto);
    return await dao.salvar(dto);
  }

  Future<DTOMensal> alterar(DTOMensal dto) async {
    validar(dto: dto);
    return await dao.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    return await dao.excluir(id);
  }

  Future<List<DTOMensal>> consultar() async {
    return await dao.consultar();
  }

  dynamic get id => _id;
  dynamic? get clienteId => _clienteId;
  dynamic? get veiculoId => _veiculoId;
  DateTime? get dataInicio => _dataInicio;
  DateTime? get dataFim => _dataFim;
  double? get valorMensal => _valorMensal;

  set id(dynamic id) {
    _id = id;
  }

  set clienteId(dynamic? id) {
    _clienteId = id;
  }

  set veiculoId(dynamic? id) {
    _veiculoId = id;
  }

  set dataInicio(DateTime? dataInicio) {
    if (dataInicio == null) throw Exception('Data de início não pode ser nula');
    _dataInicio = dataInicio;
  }

  set dataFim(DateTime? dataFim) {
    if (dataFim == null) throw Exception('Data de fim não pode ser nula');
    _dataFim = dataFim;
  }

  set valorMensal(double? valorMensal) {
    if (valorMensal == null) throw Exception('Valor mensal não pode ser nulo');
    _valorMensal = valorMensal;
  }
}