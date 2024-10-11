import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

class VeiculoLista extends StatelessWidget {
  const VeiculoLista({super.key});

  CircleAvatar circleAvatar(String? modelo) {
    return const CircleAvatar(child: Icon(Icons.directions_car));
  }

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
        icon: const Icon(Icons.edit),
        color: Colors.orange,
        onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, VoidCallback remove) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Excluir'),
            content: const Text('Confirma a exclusão?'),
            actions: [
              TextButton(
                child: const Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                onPressed: remove,
                child: const Text('Sim'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var apVeiculo = APVeiculo();
    var lista = apVeiculo.consultarVeiculos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Veículos'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/inserirVeiculo');
              }),
        ],
      ),
      body: FutureBuilder(
        future: lista,
        builder:
            (BuildContext context, AsyncSnapshot<List<DTOVeiculo>> futuro) {
          if (!futuro.hasData || futuro.data == null) {
            return const CircularProgressIndicator();
          } else {
            List<DTOVeiculo> lista = futuro.data!;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                var veiculo = lista[i];
                return ListTile(
                  leading: circleAvatar(veiculo.modelo),
                  title: Text(veiculo.placa),
                  subtitle: Text(veiculo.modelo),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        iconEditButton(() {
                        }),
                        iconRemoveButton(context, () async {
                          await apVeiculo.excluirVeiculo(veiculo.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Veículo removido com sucesso!')),
                          );
                        }),
                      ],
                    ),
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