import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:swipeflix/database/database_models.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "swipeflix.db";
  static const String jsonInsert = "truncated_title.basics.json";

  static Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(// Create Table `title_basics` => Movies
            "CREATE TABLE title_basics (title_id TEXT PRIMARY KEY ASC ON CONFLICT REPLACE NOT NULL UNIQUE ON CONFLICT REPLACE, title_type TEXT NOT NULL, title_primaryTitle TEXT NOT NULL, title_originalTitle  TEXT    NOT NULL, title_isAdult INTEGER NOT NULL, title_startYear NUMERIC NOT NULL, title_endYear NUMERIC, title_runtimeMinutes TEXT, title_genre TEXT, title_posterURL TEXT);");
        await db.execute(// Create Table `likedList` => LikedList
            "CREATE TABLE likedList (title_title_id TEXT PRIMARY KEY ASC ON CONFLICT REPLACE CONSTRAINT fk_likedList_title_id REFERENCES title_basics (title_id) NOT NULL, like_timestamp TEXT );");
        await db.execute(// Create Table `dislikedList` => DislikedList
            "CREATE TABLE dislikedList (title_title_id TEXT PRIMARY KEY ASC ON CONFLICT REPLACE CONSTRAINT fk_dislikedList_title_id REFERENCES title_basics (title_id), dislike_timestamp TEXT );");
        await db.execute(// Create Table `watchLaterList` => WatchList
            "CREATE TABLE watchLaterList (title_title_id TEXT PRIMARY KEY ASC ON CONFLICT REPLACE CONSTRAINT fk_watchLater_title_id REFERENCES title_basics (title_id) NOT NULL, watchList_timestamp TEXT );");
      },
      version: _version,
    );
  }

// Local Database
// Insert Movies in local database
  Future<void> insertMovies() async {
    final response =
        await rootBundle.loadString(join('assets/database/', jsonInsert));
    final data = await jsonDecode(response);
    for (var i in data) {
      final movie = Movie.fromJson(i);
      addMovie(movie);
    }
    print('Done inserting movies from JSON.');
  }

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
  Future<List<Movie?>> getMovie(String identifier, dynamic id) async {
    final db = await _getDatabase();
    try {
      final List<Map<String, dynamic>> maps = await db
          .query('title_basics', where: '$identifier = ?', whereArgs: [id]);
      print('Movie found!');
      return maps.map((e) => Movie.fromJson(e)).toList();
    } catch (err) {
      print('There was an error finding the movie: $err');
      return [];
    }
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

// List Tables
// Add Movie to List via ID
  Future<void> addMovieToList(String list, String id) async {
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
          'title_title_id': id,
          timestamp: DateTime.now().toString(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// Getting List
  Future<List<Map<String, dynamic>>> getList(String list) async {
    final db = await _getDatabase();
    return db.query(list);
  }

// Deleting Movie from List
  Future<void> deleteMovieFromList(String list, user, String id) async {
    final db = await _getDatabase();
    db.delete(list, where: 'title_title_id = ?', whereArgs: [id]);
  }

  void closeDatabase() async {
    final db = await _getDatabase();
    await db.close();
  }

  Future<void> deleteDatabase() async {
    final db = await _getDatabase();

    db.rawQuery('DELETE FROM title_basics');
    db.rawQuery('DELETE FROM watchLaterList');
    db.rawQuery('DELETE FROM likedList');
    db.rawQuery('DELETE FROM dislikedList');
  }
}
