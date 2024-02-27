import '../Model/Notes_Model.dart';

abstract class NotesStates{}
class InitialState extends NotesStates{}
class LoadingState extends NotesStates{}
class LoadedState extends NotesStates{
  List<NotesModel>?arrNotes=[];
  int? id;
  LoadedState({this.arrNotes,this.id});
}
class ErrorState extends NotesStates{
  String errormsg;
  ErrorState({required this.errormsg});
}