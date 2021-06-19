import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:drawing_machine/models/hiragana.dart';
import 'package:drawing_machine/models/katakana.dart';

class Connection{
  Future<Database> database;

  Future<void> openConnection() async{
    database = openDatabase(
      join(await getDatabasesPath(), 'write_it_DB.db'),
      version: 1,
    );
  }

  Future<void> addHiragana(Hiragana hiragana) async{
    final Database db = await database;
    if(db != null){
      db.insert(
        'hiraganas',
        hiragana.mapHiragana(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> addKatakana(Katakana katakana) async{
    final Database db = await database;
    if(db != null){
      db.insert(
        'katakanas',
        katakana.mapKatakana(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Hiragana>> getHiragana(String hiragana) async{
    final Database db = await database;
    final List<Map<String, dynamic>> hiraganaList = await db.query(
      'hiraganas',
      where: 'hiragana = ?',
      whereArgs: [hiragana],
    );
    return List.generate(hiraganaList.length, (index){
      return Hiragana(
        hiragana: hiraganaList[index]['hiragana'],
        time: hiraganaList[index]['time'],
        star: hiraganaList[index]['star'],
      );
    });
  }

  Future<List<Katakana>> getKatakana(String katakana) async{
    final Database db = await database;
    final List<Map<String, dynamic>> katakanaList = await db.query(
      'katakanas',
      where: 'katakana = ?',
      whereArgs: [katakana],
    );
    return List.generate(katakanaList.length, (index){
      return Katakana(
        katakana: katakanaList[index]['katakana'],
        time: katakanaList[index]['time'],
        star: katakanaList[index]['star'],
      );
    });
  }

  Future<List<Hiragana>> getAllHiragana() async{
    final Database db = await database;
    final List<Map<String, dynamic>> hiraganaList = await db.query('hiraganas');

    return List.generate(hiraganaList.length, (index){
      return Hiragana(
        hiragana: hiraganaList[index]['hiragana'],
        time: hiraganaList[index]['time'],
        star: hiraganaList[index]['star'],
      );
    });
  }

  Future<List<Katakana>> getAllKatakana() async{
    final Database db = await database;
    final List<Map<String, dynamic>> katakanaList = await db.query('katakanas');

    return List.generate(katakanaList.length, (index){
      return Katakana(
        katakana: katakanaList[index]['katakana'],
        time: katakanaList[index]['time'],
        star: katakanaList[index]['star'],
      );
    });
  }

  Future<void> closeDatabase() async{
    final Database db = await database;
    //Close Database
    db.close();
  }
}