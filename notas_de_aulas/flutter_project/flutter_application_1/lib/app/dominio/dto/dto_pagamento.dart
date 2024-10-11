class DTOPagamento {
  final int id; 
  final double valor; 
  final DateTime data; 
  final int idRegistro; 

  DTOPagamento({
    required this.id, 
    required this.valor, 
    required this.data, 
    required this.idRegistro, 
  });
}