import 'dart:async';

import 'package:path/path.dart';
import 'package:pharmacy/src/model/fav_model.dart';
import 'package:pharmacy/src/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String tableName = "user_list";
  static const String columnId = "id";
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'advadv.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $tableName('
      '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT, '
      'gender INTEGER, '
      'age INTEGER)',
    );

    await db.execute(
      'CREATE TABLE fav_table('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'image TEXT)',
    );
  }

  Future<int> saveDrug(FavModel product) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      "fav_table",
      product.toJson(),
    );
    return result;
  }

  Future<int> saveUser(UserModel user) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      tableName,
      user.toJson(),
    );
    return result;
  }

  Future<List<FavModel>> getDrug() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM fav_table',
    );
    print(list);
    List<FavModel> products = <FavModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = FavModel(
        id: list[i]["id"],
        name: list[i]["name"],
        image: list[i]["image"],
      );
      products.add(items);
    }
    return products;
  }

  Future<List<UserModel>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery(
      'SELECT * FROM $tableName',
    );
    print(list);
    List<UserModel> products = <UserModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = UserModel(
        id: list[i][columnId],
        name: list[i]["name"],
        age: list[i]["age"],
        gender: list[i]["gender"],
      );
      products.add(items);
    }
    return products;
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteDrug(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      "fav_table",
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateUSer(UserModel user) async {
    var dbClient = await db;
    return await dbClient.update(
      tableName,
      user.toJson(),
      where: "$columnId = ?",
      whereArgs: [user.id],
    );
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery(
      'DELETE FROM $tableName',
    );
  }
}
