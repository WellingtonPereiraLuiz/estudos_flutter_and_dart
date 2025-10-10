// lib/services/imc_history_service.dart
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import 'package:imc/models/imc_result.dart';

class ImcHistoryService {
  final dbHelper = DatabaseHelper.instance;

  Future<void> saveImcResult(ImcResult result, String userEmail) async {
    final db = await dbHelper.database;

    await db.insert(DatabaseHelper.tableImcHistory, {
      DatabaseHelper.columnEmail: userEmail,
      DatabaseHelper.columnWeight: result.weight,
      DatabaseHelper.columnHeight: result.height,
      DatabaseHelper.columnImc: result.imc,
      DatabaseHelper.columnClassification: result.classification,
      DatabaseHelper.columnDate: result.date.toIso8601String(),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ImcResult>> getImcHistory(String userEmail) async {
    final db = await dbHelper.database;

    final resultsMaps = await db.query(
      DatabaseHelper.tableImcHistory,
      where: '${DatabaseHelper.columnEmail} = ?',
      whereArgs: [userEmail],
      orderBy: '${DatabaseHelper.columnDate} DESC',
    );

    return resultsMaps
        .map(
          (map) => ImcResult(
            id: map[DatabaseHelper.columnId] as int,
            weight: map[DatabaseHelper.columnWeight] as double,
            height: map[DatabaseHelper.columnHeight] as double,
            imc: map[DatabaseHelper.columnImc] as double,
            classification: map[DatabaseHelper.columnClassification] as String,
            date: DateTime.parse(map[DatabaseHelper.columnDate] as String),
          ),
        )
        .toList();
  }
}
