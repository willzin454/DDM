import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_vaga.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_vaga.dart';

class VagaLista extends StatelessWidget {
  const VagaLista({super.key});

  CircleAvatar circleAvatar(bool ocupada) {
    return CircleAvatar(
      backgroundColor: ocupada ? Colors.red : Colors.green,
      child: Icon(ocupada ? Icons.directions_car : Icons.local_parking),
    );
  }

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      icon: const Icon(Icons.edit),
      color: Colors.orange,
      onPressed: onPressed,
    );
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
            content: const Text('Confirma a Exclusão?'),
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
    var apVaga = APVaga();
    var lista = apVaga.consultar();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Vagas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: lista,
        builder: (BuildContext context, AsyncSnapshot<List<DTOVaga>> futuro) {
          if (!futuro.hasData || futuro.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<DTOVaga> lista = futuro.data!;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                var vaga = lista[i];
                return ListTile(
                  leading: circleAvatar(vaga.ocupada),
                  title: Text(vaga.numero),
                  onTap: () {
                  },
                  subtitle: Text(vaga.ocupada ? 'Ocupada' : 'Livre'),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        iconEditButton(() {
                        }),
                        iconRemoveButton(context, () {                 
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
