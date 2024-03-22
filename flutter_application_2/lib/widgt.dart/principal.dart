import 'package:flutter/material.dart';

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
              print("Form Aluno");
            },
          ),
          ElevatedButton(
            child: Text("Lista Aluno"),
            onPressed: () {
              print("Lista Aluno");
            },
          ),
          ElevatedButton(
            child: Text("Detalhes do Aluno"),
            onPressed: () {
              print("Detalhes do Aluno");
            },
          ),
        ], //children é uma lista de widgets...
      ),
    );
  }
}
