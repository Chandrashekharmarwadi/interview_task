import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Model/Notes_Model.dart';
class DbHelper{
  DbHelper._();
  static final DbHelper instance = DbHelper._();
  late Database _database;
  static const notes_table = "Notes_Table";
  static const notes_id = "Notes_Id";
  static const notes_title = "Notes_Title";
  static const notes_desc = "Notes_Desc";
  
  Future<Database> getDB()async{
    if(_database!=null){
      return _database!;
    }
    else{
      return await initDB();
    }
  }
  
  Future<Database> initDB()async{
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath = join(directory.path+"notesdb.db");
    return openDatabase(dbpath,version: 1,onCreate: (db,version){
      return db.execute(" create table $notes_table( $notes_id integer primary key autoincrement, $notes_title text, $notes_desc text ) ");
    });
  }
  //For Adding Data
  InsertData(NotesModel notesModel)async{
    var db = await getDB();
   await db.insert(notes_table, notesModel.toMap());
  }
  //For Fetching Data
  Future<List<NotesModel>>getData()async{
    var db = await getDB();
    List<NotesModel>ListNotes=[];
    var data = await db.query(notes_table);
    for(Map<String,dynamic>eachData in data){
      NotesModel notesModel = NotesModel.fromMap(eachData);
      ListNotes.add(notesModel);
    }
    return ListNotes;
  }
  Future<bool>UpdateNotes(NotesModel notesModel)async{
    var db = await getDB();
    var count = await db.update(notes_table, notesModel.toMap(),where: '$notes_id=${notesModel.id}');
    return count>0;
  }
  Future<bool> DeleteNotes(int id)async{
    var db = await getDB();
    var count = await db.delete(notes_table, where: "$notes_id= ?",whereArgs: [id]);
    return count>0;
  }
  
}