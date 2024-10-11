import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_pagamento.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_pagamento.dart';

class InserirPagamentoScreen extends StatelessWidget {
  final TextEditingController valorController = TextEditingController();
  final TextEditingController idRegistroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Pagamento'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context,
                  '/listarPagamentos');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: valorController,
              decoration:
                  const InputDecoration(labelText: 'Valor do Pagamento'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: idRegistroController,
              decoration: const InputDecoration(labelText: 'ID do Registro'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final pagamentoDto = DTOPagamento(
                  id: 0, 
                  valor: double.parse(valorController.text),
                  data: DateTime.now(),
                  idRegistro: int.parse(idRegistroController.text),
                );
                final apPagamento = APPagamento();
                await apPagamento.salvarPagamento(pagamentoDto);

                // Limpar os campos após a inserção
                valorController.clear();
                idRegistroController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Pagamento inserido com sucesso!')),
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