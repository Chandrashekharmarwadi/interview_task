
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/Notes_Cubit.dart';
import '../Model/Notes_Model.dart';
import '../Widgets/uihelper_class.dart';
import 'notes_app.dart';

class UpdateData extends StatefulWidget {
  int? id;
  String title;
  String desc;
  UpdateData({required this.id,required this.title,required this.desc});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    titleController.text = widget.title;
    descController.text = widget.desc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Update Data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
        UiHelper.CustomTextField(titleController, "Enter Title", Icons.title),
        UiHelper.CustomTextField(descController, "Enter Description", Icons.description_outlined),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          var title = titleController.text.toString();
          var desc = descController.text.toString();
          context.read<NotesCubit>().updateNote(NotesModel(title: title, desc: desc, id:widget.id));
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CubitNoteApp()));
          // Navigator.pop(context);
        }, child: Text("Update Data"))
      ],),
    );
  }
}
