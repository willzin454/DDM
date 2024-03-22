import 'package:flutter/material.dart';

class ListaAluno extends StatelessWidget {
  const ListaAluno({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text("Lista de Aluno")),
    //   body: const Text("Lista de Aluno"),
    // );
    return ElevatedButton(
        onPressed: () => Navigator.pop(context), child: Text("Voltar"));
  }
}
