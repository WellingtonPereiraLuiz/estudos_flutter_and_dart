// lib/services/auth_service.dart
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';

class AuthService {
  static const String _loggedInKey = 'isLoggedIn';
  static const String _currentUserEmailKey = 'currentUserEmail';

  final dbHelper = DatabaseHelper.instance;

  // --- Funções de Autenticação (Sqflite) ---

  Future<void> register(String email, String password) async {
    final db = await dbHelper.database;

    final existingUser = await db.query(
      DatabaseHelper.tableUsers,
      where: '${DatabaseHelper.columnEmail} = ?',
      whereArgs: [email],
    );

    if (existingUser.isNotEmpty) {
      throw Exception("E-mail já cadastrado.");
    }

    await db.insert(DatabaseHelper.tableUsers, {
      DatabaseHelper.columnEmail: email,
      DatabaseHelper.columnPassword: password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> login(String email, String password) async {
    final db = await dbHelper.database;

    final users = await db.query(
      DatabaseHelper.tableUsers,
      where:
          '${DatabaseHelper.columnEmail} = ? AND ${DatabaseHelper.columnPassword} = ?',
      whereArgs: [email, password],
    );

    if (users.isEmpty) {
      throw Exception("E-mail ou senha inválidos.");
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, true);
    await prefs.setString(_currentUserEmailKey, email);
  }

  // --- Funções de Estado de Login (Shared Preferences) ---

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, false);
    await prefs.remove(_currentUserEmailKey);
  }

  Future<String?> getCurrentUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currentUserEmailKey);
  }
}
