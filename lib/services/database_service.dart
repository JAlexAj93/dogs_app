import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/dog.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();

  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('dogs.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        dogName TEXT NOT NULL,
        description TEXT NOT NULL,
        age INTEGER NOT NULL,
        image TEXT NOT NULL
      )
    ''');
  }

  Future<void> insertDog(Dog dog) async {
    final db = await instance.database;
    await db.insert('dogs', dog.toMap());
  }

  Future<List<Dog>> getDogs() async {
    final db = await instance.database;
    final result = await db.query('dogs');
    return result.map((map) => Dog.fromMap(map)).toList();
  }
}
