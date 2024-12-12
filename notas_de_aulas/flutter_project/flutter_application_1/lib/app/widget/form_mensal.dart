import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_mensal.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_mensal.dart';

class FormMensal extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _clienteIdController = TextEditingController();
    final _veiculoIdController = TextEditingController();
    final _dataInicioController = TextEditingController();
    final _dataFimController = TextEditingController();
    final _valorMensalController = TextEditingController();

    void _criarMensal() async {
      if (_formKey.currentState!.validate()) {
        final clienteIdTexto = _clienteIdController.text;
        final veiculoIdTexto = _veiculoIdController.text;
        final dataInicioTexto = _dataInicioController.text;
        final dataFimTexto = _dataFimController.text;
        final valorMensalTexto = _valorMensalController.text;

        int? clienteId = int.tryParse(clienteIdTexto);
        int? veiculoId = int.tryParse(veiculoIdTexto);
        double? valorMensal = double.tryParse(valorMensalTexto);

        DTOMensal dto = DTOMensal(
          clienteId: clienteId!,
          veiculoId: veiculoId!,
          dataInicio: DateTime.parse(dataInicioTexto),
          dataFim: DateTime.parse(dataFimTexto),
          valorMensal: valorMensal!,
        );

        APMensal apMensal = APMensal();
        await apMensal.salvar(dto);

        _clienteIdController.clear();
        _veiculoIdController.clear();
        _dataInicioController.clear();
        _dataFimController.clear();
        _valorMensalController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Mensalidade salva com sucesso')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Mensalidade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _clienteIdController,
                decoration: InputDecoration(labelText: 'ID do Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o ID do Cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _veiculoIdController,
                decoration: InputDecoration(labelText: 'ID do Veículo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o ID do Veículo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dataInicioController,
                decoration: InputDecoration(labelText: 'Data de Início (AAAA-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a data de início';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dataFimController,
                decoration: InputDecoration(labelText: 'Data de Fim (AAAA-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a data de fim';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valorMensalController,
                decoration: InputDecoration(labelText: 'Valor Mensal'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o valor mensal';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _criarMensal,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}