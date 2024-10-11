import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_pagamento.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_pagamento.dart';

class PagamentoLista extends StatelessWidget {
  const PagamentoLista({super.key});

  @override
  Widget build(BuildContext context) {
    var apPagamento = APPagamento();
    var lista = apPagamento.consultarPagamentos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pagamentos'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/inserirPagamento');
              }),
        ],
      ),
      body: FutureBuilder<List<DTOPagamento>>(
        future: lista,
        builder: (BuildContext context, AsyncSnapshot<List<DTOPagamento>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum pagamento encontrado.'));
          } else {
            List<DTOPagamento> pagamentos = snapshot.data!;
            return ListView.builder(
              itemCount: pagamentos.length,
              itemBuilder: (context, index) {
                var pagamento = pagamentos[index];
                return ListTile(
                  title: Text('Valor: R\$${pagamento.valor.toStringAsFixed(2)}'),
                  subtitle: Text('Data: ${pagamento.data.toLocal()}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await apPagamento.excluirPagamento(pagamento.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pagamento removido com sucesso!')),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}