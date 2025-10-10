// lib/services/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  // Nomes das tabelas
  static const String tableUsers = 'users';
  static const String tableImcHistory = 'imc_history';

  // Campos da Tabela de Usuários
  static const String columnEmail = 'email';
  static const String columnPassword = 'password';

  // Campos da Tabela de Histórico de IMC
  static const String columnId = 'id';
  static const String columnWeight = 'weight';
  static const String columnHeight = 'height';
  static const String columnImc = 'imc_value';
  static const String columnClassification = 'classification';
  static const String columnDate = 'date';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('imc_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // 1. Tabela de Usuários
    await db.execute('''
      CREATE TABLE $tableUsers (
        $columnEmail TEXT PRIMARY KEY, 
        $columnPassword TEXT NOT NULL
      )
    ''');

    // 2. Tabela de Histórico de IMC
    await db.execute('''
      CREATE TABLE $tableImcHistory (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnEmail TEXT,
        $columnWeight REAL NOT NULL,
        $columnHeight REAL NOT NULL,
        $columnImc REAL NOT NULL,
        $columnClassification TEXT NOT NULL,
        $columnDate TEXT NOT NULL
      )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
