import 'package:flutter/material.dart';
import 'package:flutter_application_2/rota.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Tela Principal"), //se for um widget tem que usar o "Text", inves de so colocar como uma String "".
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text("Form Aluno"),
            onPressed: () {
              Navigator.pushNamed(context, Rota.FormAluno);
            },
          ),
          ElevatedButton(
            child: Text("Lista Aluno"),
            onPressed: () {
              Navigator.pushNamed(context, Rota.listaAluno);
            },
          ),
          // ElevatedButton(
          //   child: Text("Detalhes Aluno"),
          //   onPressed: () {
          //     Navigator.pushNamed(context, Rota.DetalhesAluno);
          //   },
          // ),
          criarBotao(
              titulo: "Detalhes Aluno",
              rota: Rota.DetalhesAluno,
              context: context)
        ], //children é uma lista de widgets...
      ),
    );
  }

  Widget criarBotao(
      {required titulo, required rota, required BuildContext context}) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, rota);
        },
        child: Text(titulo));
  }
}
