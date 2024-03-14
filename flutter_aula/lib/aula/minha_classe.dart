// class MinhaClasse {
//   int x = 0;
//   int y = 0;
//   MinhaClasse(int x, [int y = 5]) {            //[] = parametro opicional
//     print('x é $x o atributo x é ${this.x}');
//     this.x = x;
//     this.y = y;
//     print('x é ${this.x} y é ${this.y}');
//   }
// }
class MinhaClasse {
  int x = 0;
  int y = 0;
  MinhaClasse({required this.x, required this.y}) {
    print('x é ${this.x} y é ${this.y}');
  }
}