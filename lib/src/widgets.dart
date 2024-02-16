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

  // Widget CustomTextField({TextEditingController? controller,text,required String title,bool? obscureText}) {
  //   return  TextField(
  //               controller: controller,
  //               decoration: InputDecoration(
  //                 label: Text(title),
  //                 border: InputBorder.none,
  //                 contentPadding:
  //                     EdgeInsets.symmetric(vertical: 15, horizontal: 16),
  //               ),
  //               obscureText: obscureText??false ,
  //               );
                
  // }

  @override
  Widget CustomTextField({String? label, String? hintText, prefixIcon, suffixIcon,TextEditingController? controller, bool? obscureText,String? obscuringCharacter}){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 5),
                blurRadius: 5
            ),
            BoxShadow(
              color: Colors.white,
            ),
          ]
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label:Text(label??""),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          hintStyle: const TextStyle(color: Colors.black38),
          hintText : hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        obscuringCharacter: obscuringCharacter ?? '*',
        obscureText: obscureText ?? false,
      ),
    );
  }
}
