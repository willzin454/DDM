import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

class FormVeiculo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _placaController = TextEditingController();
    final _modeloController = TextEditingController();
    final _marcaController = TextEditingController();
    final _corController = TextEditingController();

    void _criarVeiculo() async {
      if (_formKey.currentState!.validate()) {
        final placa = _placaController.text;
        final modelo = _modeloController.text;
        final marca = _marcaController.text;
        final cor = _corController.text;

        DTOVeiculo dto = DTOVeiculo(
          placa: placa,
          modelo: modelo,
          marca: marca,
          cor: cor,
          ativo: true,
        );

        APVeiculo apVeiculo = APVeiculo();
        await apVeiculo.salvar(dto);

        _placaController.clear();
        _modeloController.clear();
        _marcaController.clear();
        _corController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Veículo salvo com sucesso')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _placaController,
                decoration: InputDecoration(labelText: 'Placa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a placa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modeloController,
                decoration: InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o modelo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _marcaController,
                decoration: InputDecoration(labelText: 'Marca'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a marca';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _corController,
                decoration: InputDecoration(labelText: 'Cor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a cor';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _criarVeiculo,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}