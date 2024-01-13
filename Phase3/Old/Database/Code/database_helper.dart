//import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'test2.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createUser(database);
      },
    );
  }

static Future<void> createUser(sql.Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS user (
        user_id TEXT PRIMARY KEY
      );
      """);
  }


  // Create new item 
  static Future<int> insertUser(String? userID) async {
    final db = await DatabaseHelper.db();

    final data = {'user_id': userID};
    final id = await db.insert('user', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  

  // Read all items 
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await DatabaseHelper.db();
    return db.query('user', orderBy: "user_id");
  }

  // // Get a single item by id
  // //We dont use this method, it is for you if you want it.
  //   static Future<List<Map<String, dynamic>>> getItem(int id) async {
  //   final db = await DatabaseHelper.db();
  //   return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  // }

  // // Update an item by id
  // static Future<int> updateItem(
  //     int id, String title, String? descrption) async {
  //   final db = await DatabaseHelper.db();

  //   final data = {
  //     'title': title,
  //     'description': descrption,
  //     'createdAt': DateTime.now().toString()
  //   };

  //   final result =
  //       await db.update('items', data, where: "id = ?", whereArgs: [id]);
  //   return result;
  // }

  // // Delete
  // static Future<void> deleteItem(int id) async {
  //   final db = await DatabaseHelper.db();
  //   try {
  //     await db.delete("items", where: "id = ?", whereArgs: [id]);
  //   } catch (err) {
  //     debugPrint("Something went wrong when deleting an item: $err");
  //   }
  // }
}
