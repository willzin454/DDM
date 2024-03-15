// import 'dart:io';

// //main() {
// //  print('Aula funções\nwi');
// //  var nome = stdin.readLineSync();
// //  print('meu nome é+ $nome');
// //  print('idade');
// //  var entradaIdade = stdin.readLineSync()!;
// //  var idade = int.parse(entradaIdade);
// //var idade = entradaIdade as int; //int.parse
// //  print('meu nome é $nome, a minha idade é $idade');
// //}

// //Atividade 01
// //  a) Solicite 2 notas de avaliações e calcule a média;
// // main() {
// //   print('Notas: ');
// //   var entradaNota1 = stdin.readLineSync()!;
// //   var nota1 = int.parse(entradaNota1);

// //   var entradaNota2 = stdin.readLineSync()!;
// //   var nota2 = int.parse(entradaNota2);

// //   var media = (nota1 + nota2) / 2;
// //   print('Sua media foi: $media');
// // }

// //  b) Refaça o exercício anterior validado se as notas informadas são válidas (de 0 à 10);
// // main() {
// //   print('Notas: ');
// //   int cont = 0;

// //   do {
// //     var entradaNota1 = stdin.readLineSync()!;
// //     var nota1 = int.parse(entradaNota1);

// //     var entradaNota2 = stdin.readLineSync()!;
// //     var nota2 = int.parse(entradaNota2);

// //     if (nota1 <= 0 || nota1 => 10 && nota2 <= 0 || nota2 => 10) {
// //       print('As notas não estão no padrão entre 0 a 10.');
// //     } else {
// //       var media = (nota1 + nota2) / 2;
// //       print('Sua media foi: $media');
// //     }
// //   } while (cont == 0);
// // }

// //  c) Com a média calculada, verifique se o aluno está aprovado (maior ou igual à 6).
// // main() {
// //   print('Notas: ');
// //   int cont = 0;

// //   do {
// //     var entradaNota1 = stdin.readLineSync()!;
// //     var nota1 = int.parse(entradaNota1);

// //     var entradaNota2 = stdin.readLineSync()!;
// //     var nota2 = int.parse(entradaNota2);

// //     if (nota1 <= 0 || nota1 => 10 && nota2 <= 0 || nota2 => 10) {
// //       print('As notas não estão no padrão entre 0 a 10.');
// //     } else {
// //       var media = (nota1 + nota2) / 2;
// //       print('Sua media foi: $media');
// //       if (media => 6) {
// //         print('Aprovado');
// //       } else {
// //         print('Reprovado');
// //       }
// //     }
// //   } while (cont == 0);
// // }
// //  d) Faça 3 exemplos do seu projeto.

// //flutter pub get
// //fluter pub clean

// // Desafio! fazer o exercicio anterior usando funções, funções com retorno, funções com parametro e retorno.

// // void media() {
// //   var entradaNota1 = stdin.readLineSync()!;
// //   var nota1 = int.parse(entradaNota1);

// //   var entradaNota2 = stdin.readLineSync()!;
// //   var nota2 = int.parse(entradaNota2);

// //   var media = (nota1 + nota2) / 2;
// //   print('Sua media foi: $media');
// // }

// // int nomeFuncao2(nota1, nota2) {
// //   int media = (nota1 + nota2) / 2;

// //   return media;
// // }

// // void funcaoParam(int x, String y) {}

// // int funcaoParam2(int x, String y) {
// //   return 0;
// // }

// main() {
//   print("aula");
//   //funcao(5, 'dart');
//   print(
//       '${ehAprovado(nota1: 10, nota2: 6, calcularMedia: calcularMediaPercentual, faltas: 10)}');
//   print(
//       '${ehAprovado(nota1: 10, nota2: 6, calcularMedia: (double n1, double n2) => (n1 + n2) / 2,
//         faltas: 10)}');
// }

// // void funcao(int x, String y) {
// //   print("variavel x é $x e y é $y");
// //   //print('o aluno esta ${ehAprovado(6, 7)}');
// //   funcaoParamNomeado(idade: 5, nome: 'Maria');
// //   funcaoParamNomeado(nome: 'João', idade: 55);
// //   // funcaoParamNomeado(idade: 55);  esta dando erro pois falta parametro
// // }

// // // bool ehAprovado(double nota1, double nota2,
// // //     [double mediaAprovacao = 6, int flatasMax = 10]) {
// // //   //  [] = usados para caso de parametros opicionais
// // //   var media = (nota1 + nota2) / 2;
// // //   return (media >= mediaAprovacao);
// // // }

// bool ehAprovado(
//     {required double nota1,
//     required double nota2,
//     required Function(double, double) calcularMedia,
//     required int faltas,
//     double mediaAprovacao = 6,
//     int flatasMax = 10}) {
//   //[] = usados para caso de parametros opicionais
//   var media = calcularMedia(nota1, nota2);
//   var ehAprovadaNota = (media >= mediaAprovacao);
//   var ehAprovadaFaltas = faltas <= flatasMax;
//   return ehAprovadaFaltas && ehAprovadaNota;
// }

// // // void funcaoParamNomeado({int idade = 0, String nome = 'william'}){
// // //     print('nome: $nome, idade: $idade');
// // // }

// // void funcaoParamNomeado({required int idade, required String nome}) {
// //   print('nome: $nome, idade: $idade');
// // }

// double calcularMediaPercentual(double nota1, double nota2) {
//   //funções nomeadas servem para usar mais de uma vez
//   double media = (nota1 * 0.6) + (nota2 * 0.4);
//   return media;
// }

// int sintaxeParametroFuncao(int x, int y, Function f) {
//   //tem que receber uma função equivalente ao numero de parametros, que tenha uma a função é variavel
//   if (x > 10) {
//     x = 0;
//   }
//   if (y > 5) {
//     y = 5;
//   }
//   return f(x, y, f);
// }
import 'minha_classe.dart';
import 'sua_classe.dart';

void main(List<String> args) {
  // MinhaClasse mc = new MinhaClasse(x:1, y:5);
  // var mc2 = MinhaClasse(x:2, y:8);
  // MinhaClasse(x:3, y:10);
  Cliente cliente = new Cliente("12:30");
}
