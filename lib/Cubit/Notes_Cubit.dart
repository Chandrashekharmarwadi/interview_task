
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Database/DBHelper.dart';
import '../Model/Notes_Model.dart';
import 'Cubit_State.dart';

class NotesCubit extends Cubit<NotesStates>{
  DbHelper dbHelper;
  NotesCubit({required this.dbHelper}):super(InitialState());

  addNotes(NotesModel newNotes)async{
    emit(LoadingState());
    bool check = await dbHelper.InsertData(newNotes);
    if(check){
      var notes = await dbHelper.getData();
      emit(LoadedState(arrNotes: notes));
    }
    else{
      ErrorState(errormsg: "Data has not be added in database");
    }
  }
  fetInitialData()async{
    emit(LoadingState());
    var notes = await dbHelper.getData();
    emit(LoadedState(arrNotes: notes));
  }
  updateNote(NotesModel notesModel)async{
    // emit(LoadingState());
    bool check = await dbHelper.UpdateNotes(notesModel);
    if(check){
      var notes = await dbHelper.getData();
      emit(LoadedState(arrNotes: notes));
    }
    else{
      ErrorState(errormsg: "Data in Database has not be Updated");
    }
  }
  deleteNote(int id)async{
    emit(LoadingState());
    bool check = await dbHelper.DeleteNotes(id);
    if(check){
      var notes = await dbHelper.getData();
      emit(LoadedState(arrNotes: notes));
    }
    else{
      ErrorState(errormsg: "Data not Deleted");
    }
  }

}