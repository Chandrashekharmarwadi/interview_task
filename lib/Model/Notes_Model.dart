

import '../Database/DBHelper.dart';

class NotesModel{
  int? id;
  String title;
  String desc;

  NotesModel({this.id,required this.title,required this.desc});
  factory NotesModel.fromMap(Map<String,dynamic>map){
    return NotesModel(title: map[DbHelper.notes_title], desc: map[DbHelper.notes_desc],id:map[DbHelper.notes_id]);
  }
  Map<String,dynamic>toMap(){
    return {
      DbHelper.notes_id:id,
      DbHelper.notes_title:title,
      DbHelper.notes_desc:desc,
    };
  }
}