import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_mensal.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_mensal.dart';
import 'package:flutter_application_1/app/rotas.dart';

class ListaMensal extends StatefulWidget {
  _ListaMensalState createState() => _ListaMensalState();
}

class _ListaMensalState extends State<ListaMensal> {
  late Future<List<DTOMensal>> _futureMensais;

  @override
  void initState() {
    super.initState();
    _futureMensais = consultar();
  }

  Future<List<DTOMensal>> consultar() async {
    APMensal aplicacao = APMensal();
    return await aplicacao.consultar();
  }

  Widget criarBotao(String rotulo, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(rotulo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Mensalistas'),
      ),
      body: FutureBuilder(
          future: _futureMensais,
          builder: (BuildContext context, AsyncSnapshot<List<DTOMensal>> consulta) {
            if (consulta.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (consulta.hasError) {
              return Text('Erro: ${consulta.error}');
            } else if (!consulta.hasData || consulta.data!.isEmpty) {
              return Text('Dados não encontrados');
            } else {
              List<DTOMensal> lista = consulta.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          var mensal = lista[index];
                          return ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Cliente ID: ${mensal.clienteId}'),
                            subtitle: Text('Veículo ID: ${mensal.veiculoId}'),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: criarBotao("Cadastrar Novo Mensalista", () {
                      Navigator.pushNamed(context, Rotas.formMensal);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: criarBotao("Atualizar", () {
                      setState(() {
                        _futureMensais = consultar();
                      });
                    }),
                  ),
                ],
              );
            }
          }),
    );
  }
}