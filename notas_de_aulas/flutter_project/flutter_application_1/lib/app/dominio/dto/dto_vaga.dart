class DTOVaga {
  final int id; 
  final int numero; 
  final String tipo; 
  final bool ocupada; 

  DTOVaga({
    required this.id,
    required this.numero,
    required this.tipo,
    this.ocupada = false,
  });
}