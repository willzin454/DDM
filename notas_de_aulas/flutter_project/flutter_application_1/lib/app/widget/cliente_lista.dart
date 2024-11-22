import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';

class ClienteLista extends StatelessWidget {
  const ClienteLista({super.key});

  @override
  Widget build(BuildContext context) {
    final apCliente = APCliente();
    final listaClientes = apCliente.consultar();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Clientes'),
      ),
      body: FutureBuilder(
        future: listaClientes,
        builder: (context, AsyncSnapshot<List<DTOCliente>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum cliente encontrado.'));
          }

          final clientes = snapshot.data!;
          return ListView.builder(
            itemCount: clientes.length,
            itemBuilder: (context, index) {
              final cliente = clientes[index];
              return ListTile(
                title: Text(cliente.nome ?? 'Sem Nome'),
                subtitle: Text(cliente.email ?? 'Sem Email'),
                trailing: const Icon(Icons.person),
              );
            },
          );
        },
      ),
    );
  }
}
