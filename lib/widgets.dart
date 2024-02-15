import 'package:flutter/material.dart';

class Widgets {
  
  Widget CustomButton(
      {required VoidCallback onPressed,
      required String text,
      MaterialStateProperty<Color?>? bgColor,
      MaterialStateProperty<Color?>? textColor}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(backgroundColor: bgColor),
    );
  }

  Widget CustomTextField({TextEditingController? controller,text,required String title,bool? obscureText}) {
    return  TextField(
                controller: controller,
                decoration: InputDecoration(
                  label: Text(title),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ),
                obscureText: obscureText??false ,
                );
                
  }
}
