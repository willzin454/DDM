import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_veiculo.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_veiculo.dart';

class VeiculoLista extends StatelessWidget {
  const VeiculoLista({super.key});

  @override
  Widget build(BuildContext context) {
    final apVeiculo = APVeiculo();
    final listaVeiculos = apVeiculo.consultarVeiculos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Veículos'),
      ),
      body: FutureBuilder(
        future: listaVeiculos,
        builder: (context, AsyncSnapshot<List<DTOVeiculo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum veículo encontrado.'));
          }

          final veiculos = snapshot.data!;
          return ListView.builder(
            itemCount: veiculos.length,
            itemBuilder: (context, index) {
              final veiculo = veiculos[index];
              return ListTile(
                title: Text(veiculo.modelo),
                subtitle: Text('Placa: ${veiculo.placa} | Cor: ${veiculo.cor}'),
                trailing: const Icon(Icons.car_rental),
              );
            },
          );
        },
      ),
    );
  }
}
