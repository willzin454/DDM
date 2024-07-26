import 'Cidade.dart';
import 'Estado.dart';

class Cliente {
  int id;
  String nome;
  Cidade cidade;
  String? trabalho;
  Estado estado;
  String? moradia;

  Cliente(
      {required this.id, 
      required this.nome,
      required this.cidade,
      required this.trabalho,
      required this.estado,
      required this.moradia});
}
