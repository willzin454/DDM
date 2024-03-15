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
  int _z = 0; // "_" = usado para identificar como privado.

  int get z => _z;                  // geters e seters em dart. eron fronction quando so tem uma linha de codigo.
  set z(int valor) => _z = valor;

  MinhaClasse({required this.x, required this.y}) {
    //{} = parametro nomeado, classe main apresenta os atributos da classe referenciando "x = *, y = *"
    print('x é ${this.x} y é ${this.y}');
  }

  void funcao(int x, int y){
    //comandos....
  }

}

// Criar as seguintes classes: 
//   >> Todos com parâmetros nomeados no construtor
//   Estado{id,nome,sigla}
//   Cidade{id,nome,Estado}
//   Cliente{id,nome,Cidade -trabalho, Cidade -moradia}
//   Fornecedor{id,nome,Cidade -trabalho, Cidade -moradia}
//   Venda{id, Cliente, Fornecedor, Função - cálculo comissão}
