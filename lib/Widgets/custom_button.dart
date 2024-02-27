import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  String textButton;
  VoidCallback onPressed;
  Custom_Button({required this.onPressed, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(textButton,style: TextStyle(color: Colors.white,fontSize: 22)),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
        minimumSize: Size(MediaQuery.of(context).size.width,60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9)
        )),
      ),
    );
  }
}
