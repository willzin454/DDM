class DTOVaga {
  dynamic id;
  final String numero;
  final bool ocupada;

  DTOVaga({
    this.id,
    required this.numero,
    this.ocupada = false,
  });
}