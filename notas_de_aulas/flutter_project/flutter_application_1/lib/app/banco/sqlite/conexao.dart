import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/app/banco/sqlite/script.dart';

class Conexao {
  static late Database _db;

  static Future<Database> iniciar() async {
    var path = join(await getDatabasesPath(), 'banco.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      criarTabelas.forEach(db.execute);
      insercoes.forEach(db.execute);
    },
        singleInstance:
            true
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
