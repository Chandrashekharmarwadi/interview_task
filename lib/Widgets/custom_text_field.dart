import 'package:flutter/material.dart';

class CustomTextField01 extends StatelessWidget {
  String text;
  TextEditingController controller;
  bool toHide;
  IconData? iconData;
   CustomTextField01({required this.controller,required this.text,required this.toHide,this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Container(
        height: 65,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: text,
              // suffixIcon: Icon(iconData),
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}
