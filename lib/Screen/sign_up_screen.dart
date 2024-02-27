import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_field.dart';
import '../Widgets/uihelper_class.dart';
import 'log_in_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUp(String email, String password)async{
    if(email==""&&password==""){
      return UiHelper.CustomAlertBox(context, "Enter required field");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
          return UiHelper.CustomAlertBox(context, "User Created");
        }).then((value){
          log("Data Inserted");
        });
      }
      on FirebaseAuthException catch (ex){
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
              controller: emailController,
              text: "Email",
              toHide: false,
            ),
            CustomTextField01(
                controller: passwordController,
                text: "Password",
                toHide: false),
            SizedBox(
              height: 10,
            ),
            Custom_Button(onPressed: () {
              SignUp(emailController.text.toString(), passwordController.text.toString());
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
            }, textButton: "Sign Up"),
          ],
        ),
      ),
    );
  }
}
