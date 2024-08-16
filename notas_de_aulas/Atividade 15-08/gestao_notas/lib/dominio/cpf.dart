class CPF {
  late List<int> numerosCPF;
  CPF(String cpf) {
    // cpf = cpf.replaceAll('.', '');
    // cpf = cpf.replaceAll('-', '');
    if (cpf == '') throw Exception('CPF não pode ser vazio!');
    cpf = cpf.replaceAll(
        RegExp(r'\d'), ''); // esta linha faz o mesmo que a 3 e 4.
    List<String> temp = cpf.split('');
    // numerosCPF = <int>[];
    // for (var e in temp) {
    //   int numero = int.parse(e);
    //   numerosCPF.add(numero);
    // } // da linha 10 a 14 faz a mesma coisa da linha 16.

    numerosCPF = cpf
        .split('')
        .map(int.parse)
        .toList(); // 'map' igual ao 'for' porem gera um novo array
  }

  bool eOnzeNumeros() {
    if (numerosCPF.length == 11) throw Exception('CPF deve possuir 11 números');
    return true;
  }

  bool eNumeroDiferentes() {
    var diferente = false;
    for (var i = 0; i < 9; i++) {
      if (numerosCPF[0] != numerosCPF[i + 1]) {
        diferente = true;
        break;
      }
    }
    if (!diferente) throw Exception("CPF não pode ter todos os numeros iguais");
    return diferente;
  }

  // bool calcularDigito() {
  //   late var total;
  //   late var total2;
  //   for (var i = 0; i < 9; i++) {
  //     for (var j = 0; j < 10; i++) {
  //       total += numerosCPF[i] * j + 1;
  //     }
  //     total2 = (total - numerosCPF[0]) + numerosCPF[9];
  //   }
  //   total = total % numerosCPF[10];
  //   if (numerosCPF[10] != total) throw Exception('O CPF esta incorreto');
  //   return false;
  // }

  int calcularDigito(int indice) {
    var soma = 0;
    for (var peso = 9; peso > -1; peso--, indice--) {
      soma += numerosCPF[indice] * peso;
    }
    var digito = soma % 11;
    if (digito == 10) digito = 0;
    return digito;
  }

  // bool eUnico() {
                                                                                
  // }
}
