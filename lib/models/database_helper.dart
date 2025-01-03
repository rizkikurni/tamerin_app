import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tamerin/models/transaction.dart' as model;

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('transactions.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        date TEXT NOT NULL,
        amount INTEGER NOT NULL,
        balance INTEGER NOT NULL
      )
    ''');
  }

  Future<int> createTransaction(model.Transaction transaction) async {
    final db = await instance.database;

    // Mendapatkan saldo terakhir
    final lastTransaction = await _getLastTransaction();
    final previousBalance = lastTransaction?.balance ?? 0;

    // Menentukan saldo berdasarkan kategori
    int newBalance = previousBalance;
    if (transaction.type == 'Income') {
      newBalance += transaction.amount;
    } else if (transaction.type == 'Outcome') {
      newBalance -= transaction.amount;
    }

    // Menyimpan transaksi dengan saldo yang diperbarui
    final newTransaction = model.Transaction(
      type: transaction.type,
      name: transaction.name,
      category: transaction.category,
      date: transaction.date,
      amount: transaction.amount,
      balance: newBalance,
    );

    return await db.insert('transactions', newTransaction.toMap());
  }

  Future<model.Transaction?> _getLastTransaction() async {
    final db = await instance.database;
    final result = await db.query(
      'transactions',
      orderBy: 'id DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return model.Transaction.fromMap(result.first);
    }
    return null;
  }

  Future<int> getBalance() async {
    final lastTransaction = await _getLastTransaction();
    return lastTransaction?.balance ?? 0;
  }

  Future<List<model.Transaction>> getLastTransactions(int count) async {
    final db = await instance.database;
    final result = await db.query(
      'transactions',
      orderBy: 'date DESC',
      limit: count,
    );
    return result.map((map) => model.Transaction.fromMap(map)).toList();
  }

  Future<List<model.Transaction>> readAllTransactions() async {
    final db = await instance.database;
    final result = await db.query('transactions', orderBy: 'date DESC');
    return result.map((map) => model.Transaction.fromMap(map)).toList();
  }

  Future<int> updateTransaction(model.Transaction transaction) async {
    final db = await instance.database;
    return db.update(
      'transactions',
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<int> deleteTransaction(int id) async {
    final db = await instance.database;
    return db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
