import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:swipeflix/database/database_models.dart';
import 'package:http/http.dart' as http;

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "swipeflix.db";

  static Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(// Create Table `title_basics` => Movies
            "CREATE TABLE title_basics (title_id TEXT PRIMARY KEY ASC ON CONFLICT REPLACE NOT NULL UNIQUE ON CONFLICT REPLACE, title_type TEXT NOT NULL, title_primaryTitle TEXT NOT NULL, title_originalTitle  TEXT    NOT NULL, title_isAdult INTEGER NOT NULL, title_startYear NUMERIC NOT NULL, title_endYear NUMERIC, title_runtimeMinutes INTEGER, title_genre TEXT, title_posterURL TEXT);");
        await db.execute(// Create Table `user` => User
            "CREATE TABLE user ( user_id TEXT PRIMARY KEY ASC ON CONFLICT FAIL NOT NULL DEFAULT user0);");
        await db.execute(// Create Table `likedList` => LikedList
            "CREATE TABLE likedList ( user_user_id TEXT CONSTRAINT fk_likedList_user_id REFERENCES user (user_id) NOT NULL PRIMARY KEY ASC ON CONFLICT IGNORE, title_title_id TEXT    CONSTRAINT fk_likedList_title_id REFERENCES title_basics (title_id) NOT NULL, like_timestamp TEXT );");
        await db.execute(// Create Table `dislikedList` => DislikedList
            "CREATE TABLE dislikedList ( user_user_id TEXT PRIMARY KEY ASC ON CONFLICT IGNORE CONSTRAINT fk_dislikedList_user_id REFERENCES user (user_id) NOT NULL, title_title_id    TEXT    CONSTRAINT fk_dislikedList_title_id REFERENCES title_basics (title_id), dislike_timestamp TEXT );");
        await db.execute(// Create Table `watchLaterList` => WatchList
            "CREATE TABLE watchLaterList (user_user_id TEXT CONSTRAINT fk_watchLater_user_id REFERENCES user (user_id) NOT NULL PRIMARY KEY ASC ON CONFLICT IGNORE, title_title_id      TEXT    CONSTRAINT fk_watchLater_title_id REFERENCES title_basics (title_id) NOT NULL, watchList_timestamp TEXT );");
      },
      version: _version,
    );
  }

// Local Database
// Movies Table:
// Adding Movies
  Future<void> addMovie(Movie movie) async {
    // Add Movie to `title_basics`
    final db = await _getDatabase();
    await db.insert("title_basics", movie.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// Updating Movies
  Future<void> updateMovie(String id, Movie movie) async {
    // Update Movie with id in `title_basics`
    final db = await _getDatabase();
    await db.update('title_basics', movie.toJson(),
        where: 'title_id = ?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// Getting Movies
  static Future<List<Map<String, dynamic>>> getAllMovies() async {
    final db = await _getDatabase();

    return await db.query("title_basics");
  }

// Getting Movie
  Future<List<Map<String, dynamic>>> getMovie(String id) async {
    final db = await _getDatabase();
    return await db.query('title_basics',
        where: 'title_id = ?', whereArgs: [id], limit: 1);
  }

// Deleting Movies
  Future<void> deleteMovie(String table, String id) async {
    // Delete Movie from Table (on function call) with id
    final db = await _getDatabase();
    try {
      await db.delete(table, where: 'title_id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint("No such element: $err");
    }
  }

// User Table
// Adding User
  Future<void> addUser(User user) async {
    // Add User to table `user`
    final db = await _getDatabase();
    await db.insert('user', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// Getting Users
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await _getDatabase();
    return await db.query('user');
  }

// Deleting User
  Future<void> deleteUser(String id) async {
    final db = await _getDatabase();
    await db.delete('user', where: 'user_id = id', whereArgs: [id]);
  }

// List Tables
// Add Movie to List
  Future<void> addMovieToList(String list, Movie movie, User user) async {
    // Add Movie to WatchList
    final db = await _getDatabase();
    final String timestamp;
    if (list == 'likedList') {
      timestamp = 'like_timestamp';
    } else if (list == 'dislikedList') {
      timestamp = 'dislike_timestamp';
    } else {
      timestamp = 'watchList_timestamp';
    }

    await db.insert(
        list,
        {
          'user_user_id': user.user_id,
          'title_title_id': movie.title_id,
          timestamp: DateTime.now().toString(),
        },
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

// Getting List
  Future<List<Map<String, dynamic>>> getList(String list) async {
    final db = await _getDatabase();
    return db.query(list);
  }

// Getting User List
  Future<List<Map<String, dynamic>>> getUserList(String list, User user) async {
    final db = await _getDatabase();
    return db.query(list, where: 'user_user_id = ?', whereArgs: [user.user_id]);
  }

// Deleting Movie from User List
  Future<void> deleteMovieFromList(String list, user, String id) async {
    final db = await _getDatabase();
    db.delete(list,
        where: 'user_user_id = ? and title_title_id = ?',
        whereArgs: [user.user_id, id]);
  }

// Deleting User List
  Future<void> deleteUserList(String list, User user) async {
    final db = await _getDatabase();
    db.delete(list, where: 'user_user_id = ?', whereArgs: [user.user_id]);
  }

  void closeDatabase() async {
    final db = await _getDatabase();
    await db.close();
  }
}
