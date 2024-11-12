import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqfliteConnectionFactory {
  static const _VERSION = 1;
  static const _DATABASE_NAME = 'SQFLITE_PROJECT';

  static SqfliteConnectionFactory? _instance;

  Database? _db;
  final _lock = Lock();

  SqfliteConnectionFactory._();

  factory SqfliteConnectionFactory() {
    _instance ??= SqfliteConnectionFactory._();

    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NAME);

    if (_db == null) {
      await _lock.synchronized(() async {
        _db ??= await openDatabase(
          databasePathFinal,
          version: _VERSION,
          onCreate: _onCreate,
        );
      });
    }
    return _db!;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> _onCreate(Database db, int version) async {}
}
