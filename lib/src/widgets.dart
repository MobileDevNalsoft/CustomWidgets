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

  Widget CustomTextField({String? label, String? hintText, prefixIcon, suffixIcon,TextEditingController? controller, bool? obscureText,String? obscuringCharacter}){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, ),
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

  Widget CustomSnackBar(BuildContext context,String content,Color color){
   return  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(content),backgroundColor: color,)
    );
  }

  Widget CustomDropDown({ double? width, required String value, required String hint, required List items,required VoidCallback? onChanged, double menuMaxHeight}){
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: width,
      decoration: BoxDecoration(
          border: Border.all(),
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
      child: DropdownButton<String>(
        hint: hint,
        value: value,
        onChanged: onChanged,
        items: items,
        alignment: Alignment.center,
        menuMaxHeight: menuMaxHeight,
        borderRadius: BorderRadius.circular(15),
        underline: Container(),
      ),
    );
  }

}
