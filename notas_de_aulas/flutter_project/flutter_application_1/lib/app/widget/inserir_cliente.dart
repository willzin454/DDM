// inserindo_cliente.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';

class InserirClienteScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Cliente'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context,
                  '/listarClientes'); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Cliente'),
            ),
            TextField(
              controller: cpfController,
              decoration: const InputDecoration(labelText: 'CPF do Cliente'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email do Cliente'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final clienteDto = DTOCliente(
                  nome: nomeController.text,
                  cpf: cpfController.text,
                  email: emailController.text,
                  status: 'A',
                );
                final apCliente = APCliente();
                await apCliente.salvar(clienteDto);

                nomeController.clear();
                cpfController.clear();
                emailController.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Cliente inserido com sucesso!')),
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