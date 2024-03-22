import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgt.dart/formulario_aluno.dart';
import 'package:flutter_application_2/widgt.dart/lista_aluno.dart';
import 'package:flutter_application_2/widgt.dart/principal.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu App",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Principal(),
        "/formAluno": (context) => FormularioAluno(),
      },
    );
  }
}
