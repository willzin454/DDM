import 'Cidade.dart';
import 'Estado.dart';

class Fornecedor {
    int id;
    Cidade cidade;
    String? trabalho;
    Estado estado;
    String? moradia;

    Fornecedor(
      {required this.id,
      required this.cidade,
      required this.trabalho,
      required this.estado,
      required this.moradia});
}
