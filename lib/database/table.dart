import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseTable{
  Future<Database> database;

  Future<void> createGameTable() async{
    database = openDatabase(
      join(await getDatabasesPath(), 'write_it_DB.db'),
      onCreate: (db, version) async{
        await db.execute('CREATE TABLE hiraganas(id INTEGER PRIMARY KEY AUTOINCREMENT, hiragana TEXT UNIQUE, time TEXT, star INTEGER)');
        await db.execute('CREATE TABLE katakanas(id INTEGER PRIMARY KEY AUTOINCREMENT, katakana TEXT UNIQUE, time TEXT, star INTEGER)');

        await db.close();
      },
      version: 1,
    );
  }
}