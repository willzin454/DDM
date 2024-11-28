import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/aplicacao/ap_cliente.dart';
import 'package:flutter_application_1/app/dominio/dto/dto_cliente.dart';
import 'package:flutter_application_1/app/rotas.dart';

class ListaPessoa extends StatefulWidget {
  @override
  _ListaPessoaState createState() => _ListaPessoaState();
}

class _ListaPessoaState extends State<ListaPessoa> {
  late Future<List<DTOCliente>> _futureClientes;

  @override
  void initState() {
    super.initState();
    _futureClientes = consultar();
  }

  Future<List<DTOCliente>> consultar() async {
    APCliente aplicacao = APCliente();
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
        title: Text('Lista de Pessoas'),
      ),
      body: FutureBuilder(
          future: _futureClientes,
          builder: (BuildContext context, AsyncSnapshot<List<DTOCliente>> consulta) {
            if (consulta.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (consulta.hasError) {
              return Text('Erro: ${consulta.error}');
            } else if (!consulta.hasData || consulta.data!.isEmpty) {
              return Text('Dados não encontrados');
            } else {
              List<DTOCliente> lista = consulta.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          var cliente = lista[index];
                          return ListTile(
                            leading: Icon(Icons.person),
                            title: Text(cliente.nome),
                            subtitle: Text(cliente.cpf),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: criarBotao("Cadastrar Novo Cliente", () {
                      Navigator.pushNamed(context, Rotas.formClientes);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: criarBotao("Atualizar", () {
                      setState(() {
                        _futureClientes = consultar();
                      });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: criarBotao("Lista de Agendamentos", () {
                      Navigator.pushNamed(context, Rotas.listaAgendamento);
                    }),
                  ),
                ],
              );
            }
          }),
    );
  }
}