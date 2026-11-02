import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._internal();

  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // Cấu hình SQLite cho Google Chrome
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }

    _database = await openDatabase(
      'expenses.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Expenses (
            id INTEGER PRIMARY KEY,
            title TEXT,
            amount REAL,
            category TEXT,
            date TEXT
          )
        ''');
        await db.insert('expenses', {
          'title': 'Ăn uống',
          'amount': 150000,
          'category': 'Sinh hoạt',
          'date': '29/10/2026',
        });
        await db.insert('expenses', {
          'title': 'Di chuyển',
          'amount': 50000,
          'category': 'Đi lại',
          'date': '28/10/2026',
        });

        await db.insert('expenses', {
          'title': 'Mua sách',
          'amount': 200000,
          'category': 'Học tập',
          'date': '27/10/2026',
        });

        await db.insert('expenses', {
          'title': 'Mua sắm',
          'amount': 1500000,
          'category': 'Sinh hoạt',
          'date': '25/10/2026',
        });

        await db.insert('expenses', {
          'title': 'Khám bệnh',
          'amount': 3550000,
          'category': 'Sức khỏe',
          'date': '22/10/2026',
        });
      },
    );

    return _database!;
  }

  Future<List<Map<String, dynamic>>> getAllExpenses() async {
    final db = await database;

    return await db.query('Expenses', orderBy: 'id ASC');
  }

  Future<int> updateExpense(int id, Map<String, dynamic> expense) async {
    final db = await database;

    return await db.update(
      'Expenses',
      expense,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = await database;
    await db.close();

    _database = null;
  }
}
