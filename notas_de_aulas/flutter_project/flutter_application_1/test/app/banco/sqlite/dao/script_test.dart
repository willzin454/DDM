import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app/banco/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('Teste do script para criar tabelas', () async {
    var db = await openDatabase(inMemoryDatabasePath, version: 1,
        onCreate: (db, version) async {
      expect(() => criarTabelas.forEach(db.execute), returnsNormally);
    });
    await db.close();
  });

  test('Teste do script para inserir registros', () async {
    var db = await openDatabase(inMemoryDatabasePath, version: 1,
        onCreate: (db, version) async {
      criarTabelas.forEach(db.execute);
      expect(() => insercoes.forEach(db.execute), returnsNormally);
    });
    await db.close();
  });
}
