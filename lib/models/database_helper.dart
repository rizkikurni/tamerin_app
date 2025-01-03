import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tamerin/models/transaction.dart' as model;
import 'package:tamerin/models/balance.dart';

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

  Future<void> _createDB(Database db, int version) async {
    // Tabel transactions
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        date TEXT NOT NULL,
        amount INTEGER NOT NULL
      )
    ''');

    // Tabel balance
    await db.execute('''
      CREATE TABLE balance (
        total INTEGER NOT NULL DEFAULT 0
      )
    ''');

    // Inisialisasi balance dengan nilai 0
    await db.insert('balance', {'total': 0});
  }

  // Mendapatkan balance saat ini
  Future<Balance> _getBalance() async {
    final db = await instance.database;
    final result = await db.query('balance', limit: 1);
    if (result.isNotEmpty) {
      return Balance.fromMap(result.first);
    }
    return Balance(total: 0);
  }

  // Memperbarui balance
  Future<void> _updateBalance(int newTotal) async {
    final db = await instance.database;
    await db.update('balance', {'total': newTotal});
  }

  // Mendapatkan transaksi berdasarkan ID
  Future<model.Transaction?> _getTransactionById(int id) async {
    final db = await instance.database;
    final result = await db.query(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return model.Transaction.fromMap(result.first);
    }
    return null;
  }

  // Membuat transaksi baru
  Future<int> createTransaction(model.Transaction transaction) async {
    final db = await instance.database;

    // Mendapatkan saldo saat ini
    final balance = await _getBalance();
    int newBalance = balance.total;

    // Update saldo berdasarkan jenis transaksi
    if (transaction.type == 'Income') {
      newBalance += transaction.amount;
    } else if (transaction.type == 'Outcome') {
      newBalance -= transaction.amount;
    }

    // Perbarui tabel balance
    await _updateBalance(newBalance);

    // Simpan transaksi baru
    return await db.insert('transactions', transaction.toMap());
  }

  // Membaca semua transaksi
  Future<List<model.Transaction>> readAllTransactions() async {
    final db = await instance.database;
    final result = await db.query('transactions', orderBy: 'date DESC');
    return result.map((map) => model.Transaction.fromMap(map)).toList();
  }

  // Membaca transaksi terakhir berdasarkan jumlah tertentu
  Future<List<model.Transaction>> getLastTransactions(int count) async {
    final db = await instance.database;
    final result = await db.query(
      'transactions',
      orderBy: 'date DESC',
      limit: count,
    );
    return result.map((map) => model.Transaction.fromMap(map)).toList();
  }

  // Menghapus transaksi
  Future<int> deleteTransaction(int id) async {
    final db = await instance.database;

    // Ambil transaksi yang akan dihapus
    final transaction = await _getTransactionById(id);
    if (transaction == null) return 0;

    // Perbarui saldo
    final balance = await _getBalance();
    int newBalance = balance.total;
    if (transaction.type == 'Income') {
      newBalance -= transaction.amount;
    } else if (transaction.type == 'Outcome') {
      newBalance += transaction.amount;
    }
    await _updateBalance(newBalance);

    // Hapus transaksi
    return db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Memperbarui transaksi
  Future<int> updateTransaction(model.Transaction transaction) async {
    final db = await instance.database;

    // Ambil transaksi lama
    final oldTransaction = await _getTransactionById(transaction.id!);
    if (oldTransaction == null) return 0;

    // Perbarui saldo berdasarkan perubahan transaksi
    final balance = await _getBalance();
    int newBalance = balance.total;

    // Hitung perubahan saldo
    if (oldTransaction.type == 'Income') {
      newBalance -= oldTransaction.amount;
    } else if (oldTransaction.type == 'Outcome') {
      newBalance += oldTransaction.amount;
    }

    if (transaction.type == 'Income') {
      newBalance += transaction.amount;
    } else if (transaction.type == 'Outcome') {
      newBalance -= transaction.amount;
    }

    // Perbarui tabel balance
    await _updateBalance(newBalance);

    // Perbarui transaksi di database
    return db.update(
      'transactions',
      transaction.toMap(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  // Mendapatkan saldo saat ini
  Future<int> getBalance() async {
    final balance = await _getBalance();
    return balance.total;
  }

  // Menutup database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
