import 'package:path/path.dart';

class Conexao {
  static late Database _db;

  static Future<Database> iniciar() async {
    var path = join(await getDatabasesPath(), 'banco.db');

    // Inicia o banco de dados sem deletá-lo
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      // Executa os scripts para criação das tabelas
      criarTabelas.forEach(db.execute);
      // Executa as inserções iniciais (se houver)
      insercoes.forEach(db.execute);
    },
        singleInstance:
            true // Garante que apenas uma instância do banco de dados será criada
        );

    return _db;
  }

  // Método para fechar o banco de dados (opcional)
  static Future<void> fechar() async {
    if (_db != null) {
      await _db.close();
    }
  }
}
