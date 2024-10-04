import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_vaga.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';

class InserirVagaScreen extends StatelessWidget {
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController ocupadaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Vaga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              decoration: const InputDecoration(labelText: 'Número da Vaga'),
            ),
            TextField(
              controller: ocupadaController,
              decoration: const InputDecoration(labelText: 'Vaga Ocupada (true/false)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final vagaDto = DTOVaga(
                  numero: numeroController.text,
                  ocupada: ocupadaController.text.toLowerCase() == 'true',
                );
                final apVaga = APVaga();
                await apVaga.salvar(vagaDto);
                numeroController.clear();
                ocupadaController.clear();

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
