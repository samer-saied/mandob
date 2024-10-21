import 'dart:developer';

import 'package:mandob_app/features/data/models/money_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static const _databaseName = 'money_db.db';
  static const _databaseVersion = 1;

  static Future<Database>? _database;

  static Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = openDatabase(
        path.join(await getDatabasesPath(), _databaseName),
        version: _databaseVersion,
        onCreate: _onCreate,
      );
      return _database;
    }
  }

  static void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        createdDate TEXT,
        editedDate TEXT,
        fiats TEXT,
        transactionsType BOOL,
        total REAL,
        description TEXT
      )
    ''');
  }

  static Future<void> insertOneTransaction(Moneymodel money) async {
    final db = await database;
    if (db != null) {
      await db.insert(
        'transactions',
        money.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  static Future<void> deleteData(int id) async {
    try {
      Database? db = await database;
      final result = await db!.delete(
        'transactions', // Replace with your table name
        where: 'id = ?',
        whereArgs: [id],
      );

      if (result == 1) {
      } else {}
      // await db.close();
    } catch (e) {
      log('Error deleting data: $e');
    }
  }

  // static Future<List<Map<String, dynamic>>> queryTransactions() async {
  static Future<List<Moneymodel>> queryTransactions() async {
    List<Moneymodel> transactionsTemp = [];
    Database? db = await database;
    List<Map<String, dynamic>> transactions = await db!.query('transactions');

    for (var element in transactions) {
      transactionsTemp.add(Moneymodel.fromJson(element));
    }

    return transactionsTemp;
  }
}
