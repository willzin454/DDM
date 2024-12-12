import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';

class DetalhesClientes extends StatelessWidget {
  final DTOCliente cliente;

  DetalhesClientes({required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${cliente.nome}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('CPF: ${cliente.cpf}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${cliente.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Descrição: ${cliente.descricao}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Status: ${cliente.status ? "Ativo" : "Inativo"}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}