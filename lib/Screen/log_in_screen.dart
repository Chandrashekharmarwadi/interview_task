
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
import '../Widgets/uihelper_class.dart';
import 'add_data.dart';



class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignIn(String email , String password)async{
    if(email==""&& password==""){
      return UiHelper.CustomAlertBox(context, "Enter Required Field");
    }
    else{
      try{
        UserCredential? userCredential;
        userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddData()));
        });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField01(
                controller: emailController, text: "Email", toHide: false),
            CustomTextField01(
                controller: passwordController,
                text: "Password",
                toHide: true),
            SizedBox(
              height: 20,
            ),
            Custom_Button(onPressed: () {
              SignIn(emailController.text.toString(), passwordController.text.toString());
            }, textButton: "Sign In"),
          ],
        ),
      ),
    );
  }
}
