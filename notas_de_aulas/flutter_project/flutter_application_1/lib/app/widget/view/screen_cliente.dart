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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: cpfController,
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final dto = DTOCliente(
                  nome: nomeController.text,
                  cpf: cpfController.text,
                  email: emailController.text,
                  status: 'A',
                );
                final apCliente = APCliente();
                await apCliente.salvar(dto);

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
