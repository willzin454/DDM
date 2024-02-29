import 'dart:io';

main() {
  print('aula funções');
  var nome = stdin.readLineSync();
  print('meu nome é+ $nome');
  print('idade');
  var entradaIdade = stdin.readLineSync()!;
  var idade = int.parse(entradaIdade);
  //var idade = entradaIdade as int; //int.parse
  print('meu nome é $nome, a minha idade é $idade');
}


//flutter pub get
//fluter pub clean