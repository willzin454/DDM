import 'package:flutter/material.dart';
import 'package:flutter_application_2/rota.dart';
import 'package:flutter_application_2/widgt.dart/formulario_aluno.dart';
import 'package:flutter_application_2/widgt.dart/lista_aluno.dart';
import 'package:flutter_application_2/widgt.dart/principal.dart';
import 'package:flutter_application_2/widgt.dart/detalhes_aluno.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)),
      routes: {
        Rota.home: (context) => Principal(),
        Rota.FormAluno: (context) => FormularioAluno(),
        Rota.listaAluno: (context) => ListaAluno(),
        Rota.DetalhesAluno: (context) => DetalhesAluno(),
      },
    );
  }
}
