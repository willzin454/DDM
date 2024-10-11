// inserindo_veiculo.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

class InserirVeiculoScreen extends StatelessWidget {
  final TextEditingController placaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController corController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Veículo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context,
                  '/listarVeiculos');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: placaController,
              decoration: const InputDecoration(labelText: 'Placa do Veículo'),
            ),
            TextField(
              controller: modeloController,
              decoration: const InputDecoration(labelText: 'Modelo do Veículo'),
            ),
            TextField(
              controller: corController,
              decoration: const InputDecoration(labelText: 'Cor do Veículo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final veiculoDto = DTOVeiculo(
                  placa: placaController.text,
                  modelo: modeloController.text,
                  cor: corController.text,
                );
                final apVeiculo = APVeiculo();
                await apVeiculo.salvarVeiculo(veiculoDto);

                placaController.clear();
                modeloController.clear();
                corController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Veículo inserido com sucesso!')),
                );
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}