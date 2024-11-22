import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/widget/inserir_cliente.dart';
import 'package:flutter_application_1/app/widget/cliente_lista.dart';
import 'package:flutter_application_1/app/widget/inserir_veiculo.dart';
import 'package:flutter_application_1/app/widget/veiculo_lista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estacionamento',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/inserirCliente': (context) => InserirClienteScreen(),
        '/listarClientes': (context) => ClienteLista(),
        '/inserirVeiculo': (context) => InserirVeiculoScreen(),
        '/listarVeiculos': (context) => VeiculoLista(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Estacionamento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inserirCliente');
                  },
                  child: const Text('Inserir Cliente'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/listarClientes');
                  },
                  child: const Text('Lista Cliente'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inserirVeiculo');
                  },
                  child: const Text('Inserir Veículo'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/listarVeiculos');
                  },
                  child: const Text('Lista Veículo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
