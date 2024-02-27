

import 'package:flutter/material.dart';

class UiHelper{
  static CustomTextField02(TextEditingController controller, String text, bool toHide,IconData iconData){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      child: TextField(
        controller: controller,
          decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
      ),
    );
  }
  static CustomAlertBox(BuildContext context ,String title){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
    });
  }
  static CustomTextField(TextEditingController controller,String text,IconData iconData){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
            )
        ),
      ),
    );
  }
}