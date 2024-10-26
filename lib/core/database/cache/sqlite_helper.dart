import 'dart:developer';

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

import '../../../features/data/models/money_model.dart';
import '../../../features/data/models/summary_model.dart';

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
  static Future<SummaryModel> queryTodayTransactions() async {
    List<Moneymodel> transactionsTemp = [];
    double credits = 0.0;
    double debits = 0.0;
    Database? db = await database;
    String today = (DateTime.now().toString().split(" ")[0]);
    List<Map<String, dynamic>> transactions = await db!.query(
      'transactions',
      where: 'createdDate > ?',
      whereArgs: [today],
    );

    for (var element in transactions) {
      Moneymodel tempMoney = Moneymodel.fromJson(element);
      transactionsTemp.add(tempMoney);
      if (tempMoney.transactionsType == true) {
        credits += tempMoney.getTotalAll();
      } else {
        debits += tempMoney.getTotalAll();
      }
    }

    return SummaryModel(
      transactions: transactionsTemp,
      credits: credits,
      debits: debits,
    );
  }

  static Future<SummaryModel> queryPeriodTransactions(
      DateTime startDate, DateTime endDate) async {
    List<Moneymodel> transactionsTemp = [];
    double credits = 0.0;
    double debits = 0.0;
    Database? db = await database;

    List<Map<String, dynamic>> transactions = await db!.query(
      'transactions',
      where: 'createdDate > ? and createdDate < ?',
      whereArgs: [
        startDate.toString().split(" ")[0],
        endDate.toString().split(" ")[0]
      ],
    );

    for (var element in transactions) {
      Moneymodel tempMoney = Moneymodel.fromJson(element);
      transactionsTemp.add(tempMoney);
      if (tempMoney.transactionsType == true) {
        credits += tempMoney.getTotalAll();
      } else {
        debits += tempMoney.getTotalAll();
      }
    }

    return SummaryModel(
      transactions: transactionsTemp,
      credits: credits,
      debits: debits,
    );
  }
}
