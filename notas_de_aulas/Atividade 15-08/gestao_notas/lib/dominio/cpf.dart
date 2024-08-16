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
    numerosCPF = <int>[];
    for (var e in numerosCPF) {
      int numero = numerosCPF[e];
      if (numero == numerosCPF[e + 1])
        throw Exception('Numeros não são diferentes');
    }
    return false;
  }

  bool eDigitosCorretos() {}

  // bool eUnico() {}
}
