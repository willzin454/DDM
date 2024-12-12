import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/rotas.dart';
import 'package:flutter_application_1/app/ui/form_cliente.dart';
import 'package:flutter_application_1/app/ui/lista_cliente.dart';
import 'package:flutter_application_1/app/ui/form_veiculo.dart';
import 'package:flutter_application_1/app/ui/lista_veiculo.dart';
import 'package:flutter_application_1/app/ui/form_mensal.dart';
import 'package:flutter_application_1/app/ui/lista_mensal.dart';
import 'package:flutter_application_1/app/ui/detalhes_pessoa.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciamento de Estacionamento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Rotas.home,
      routes: {
        Rotas.home: (context) => HomeScreen(),
        Rotas.formClientes: (context) => FormCliente(),
        Rotas.listaClientes: (context) => ListaCliente(),
        Rotas.formVeiculos: (context) => FormVeiculo(),
        Rotas.listaVeiculos: (context) => ListaVeiculo(),
        Rotas.formMensal: (context) => FormMensal(),
        Rotas.listaMensal: (context) => ListaMensal(),
        Rotas.detalhesClientes: (context) => DetalhesClientes(cliente: ModalRoute.of(context)!.settings.arguments as DTOCliente),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de Estacionamento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Rotas.listaClientes);
              },
              child: Text('Lista de Clientes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Rotas.listaVeiculos);
              },
              child: Text('Lista de Veículos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Rotas.listaMensal);
              },
              child: Text('Lista de Mensalistas'),
            ),
          ],
        ),
      ),
    );
  }
}