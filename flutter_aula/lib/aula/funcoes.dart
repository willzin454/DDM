import 'dart:io';

//main() {
//  print('Aula funções\nwi');
//  var nome = stdin.readLineSync();
//  print('meu nome é+ $nome');
//  print('idade');
//  var entradaIdade = stdin.readLineSync()!;
//  var idade = int.parse(entradaIdade);
//var idade = entradaIdade as int; //int.parse
//  print('meu nome é $nome, a minha idade é $idade');
//}

//Atividade 01
//  a) Solicite 2 notas de avaliações e calcule a média;
// main() {
//   print('Notas: ');
//   var entradaNota1 = stdin.readLineSync()!;
//   var nota1 = int.parse(entradaNota1);

//   var entradaNota2 = stdin.readLineSync()!;
//   var nota2 = int.parse(entradaNota2);

//   var media = (nota1 + nota2) / 2;
//   print('Sua media foi: $media');
// }

//  b) Refaça o exercício anterior validado se as notas informadas são válidas (de 0 à 10);
// main() {
//   print('Notas: ');
//   int cont = 0;

//   do {
//     var entradaNota1 = stdin.readLineSync()!;
//     var nota1 = int.parse(entradaNota1);

//     var entradaNota2 = stdin.readLineSync()!;
//     var nota2 = int.parse(entradaNota2);

//     if (nota1 <= 0 || nota1 => 10 && nota2 <= 0 || nota2 => 10) {
//       print('As notas não estão no padrão entre 0 a 10.');
//     } else {
//       var media = (nota1 + nota2) / 2;
//       print('Sua media foi: $media');
//     }
//   } while (cont == 0);
// }

//  c) Com a média calculada, verifique se o aluno está aprovado (maior ou igual à 6).
// main() {
//   print('Notas: ');
//   int cont = 0;

//   do {
//     var entradaNota1 = stdin.readLineSync()!;
//     var nota1 = int.parse(entradaNota1);

//     var entradaNota2 = stdin.readLineSync()!;
//     var nota2 = int.parse(entradaNota2);

//     if (nota1 <= 0 || nota1 => 10 && nota2 <= 0 || nota2 => 10) {
//       print('As notas não estão no padrão entre 0 a 10.');
//     } else {
//       var media = (nota1 + nota2) / 2;
//       print('Sua media foi: $media');
//       if (media => 6) {
//         print('Aprovado');
//       } else {
//         print('Reprovado');
//       }
//     }
//   } while (cont == 0);
// }
//  d) Faça 3 exemplos do seu projeto.

//flutter pub get
//fluter pub clean

// Desafio! fazer o exercicio anterior usando funções, funções com retorno, funções com parametro e retorno.

void media() {
  var entradaNota1 = stdin.readLineSync()!;
  var nota1 = int.parse(entradaNota1);

  var entradaNota2 = stdin.readLineSync()!;
  var nota2 = int.parse(entradaNota2);

  var media = (nota1 + nota2) / 2;
  print('Sua media foi: $media');
}

int nomeFuncao2(nota1, nota2) {
  int media = (nota1 + nota2) / 2;

  return media;
}

void funcaoParam(int x, String y) {}

int funcaoParam2(int x, String y) {
  return 0;
}
