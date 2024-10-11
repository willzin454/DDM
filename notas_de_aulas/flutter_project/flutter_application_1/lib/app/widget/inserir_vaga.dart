import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_vaga.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';

class InserirVagaScreen extends StatelessWidget {
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Vaga'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/listarVagas');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              decoration: const InputDecoration(labelText: 'Número da Vaga'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tipoController,
              decoration: const InputDecoration(labelText: 'Tipo da Vaga'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final vagaDto = DTOVaga(
                  id: 0,
                  numero: int.parse(numeroController.text),
                  tipo: tipoController.text,
                  ocupada: false,
                );
                final apVaga = APVaga();
                await apVaga.salvarVaga(vagaDto);

                numeroController.clear();
                tipoController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vaga inserida com sucesso!')),
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