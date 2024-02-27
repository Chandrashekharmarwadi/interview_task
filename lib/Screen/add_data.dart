import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/Notes_Cubit.dart';
import '../Model/Notes_Model.dart';
import '../Widgets/uihelper_class.dart';
import 'notes_app.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Add Data",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
        UiHelper.CustomTextField(titleController, "Enter Title", Icons.title),
        UiHelper.CustomTextField(descController, "Enter Description", Icons.description_outlined),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          var title = titleController.text.toString();
          var desc = descController.text.toString();
          context.read<NotesCubit>().addNotes(NotesModel(title: title, desc: desc));
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const CubitNoteApp()));
          }, child: Text("Add Data"))
      ],),
    );
  }
}
