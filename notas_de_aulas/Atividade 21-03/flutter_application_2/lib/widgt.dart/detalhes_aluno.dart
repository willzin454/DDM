import 'package:flutter/material.dart';

class DetalhesAluno extends StatelessWidget {
  const DetalhesAluno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Aluno")),
      body: const Text("Detalhes do Aluno"),
    );
  }
}
