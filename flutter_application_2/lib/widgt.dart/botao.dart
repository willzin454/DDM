import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String rota;
  final String titulo;
  const Botao({Key? key, required this.rota, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, rota),
        child: Text(titulo));
  }
}
