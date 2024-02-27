import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/Screen/update_data.dart';

import '../Cubit/Cubit_State.dart';
import '../Cubit/Notes_Cubit.dart';
import 'add_data.dart';

class CubitNoteApp extends StatefulWidget {
  const CubitNoteApp({super.key});

  @override
  State<CubitNoteApp> createState() => _CubitNoteAppState();
}

class _CubitNoteAppState extends State<CubitNoteApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NotesCubit>().fetInitialData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App Using Cubit"),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: BlocBuilder<NotesCubit,NotesStates>(builder: (context,state) {
        if(state is LoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is ErrorState){
          return Text("${state.errormsg}");
        }
        else if(state is LoadedState){
          return ListView.builder(itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateData(id: state.arrNotes![index].id!, title: state.arrNotes![index].title, desc: state.arrNotes![index].desc)));
              },
              child: ListTile(
                leading: Text("${state.arrNotes![index].id}"),
                title: Text(state.arrNotes![index].title),
                subtitle: Text(state.arrNotes![index].desc),
                trailing: IconButton(onPressed: (){
                  context.read<NotesCubit>().deleteNote(state.arrNotes![index].id!);
                }, icon: Icon(Icons.delete)),
              ),
            );
          },itemCount: state.arrNotes!.length,);
        }
        else {
          return Center(child: Text('Add New Notes'));
        }
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddData()));
      },child: Icon(Icons.add),),
    );
  }
}
