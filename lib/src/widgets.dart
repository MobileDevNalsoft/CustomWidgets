import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomWidgets {
  static Widget CustomButton(
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

  static Widget CustomTextField(
      {String? label,
      String? hintText,
      prefixIcon,
      suffixIcon,
      TextEditingController? controller,
      bool? obscureText,
      String? obscuringCharacter}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 5),
            BoxShadow(
              color: Colors.white,
            ),
          ]),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label ?? ""),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          hintStyle: const TextStyle(color: Colors.black38),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        obscuringCharacter: obscuringCharacter ?? '*',
        obscureText: obscureText ?? false,
      ),
    );
  }

  static CustomSnackBar(BuildContext context, String content, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: color,
    ));
  }

  static Widget CustomDropDown(
      {double? width,
      String? value,
      required String hint,
      required List<String> items,
      required VoidCallback? onChanged(val),
      double? menuMaxHeight}) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: width ?? 20,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 5),
            BoxShadow(
              color: Colors.white,
            ),
          ]),
      child: DropdownButton(
        hint: Text(hint),
        // value: value,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        alignment: Alignment.center,
        menuMaxHeight: menuMaxHeight ?? 20,
        borderRadius: BorderRadius.circular(15),
        underline: Container(),
      ),
    );
  }

  static Widget CustomCircularLoader() {
    return Center(
      child: RiveAnimation.asset('assets/animations/logo.riv'),
    );
  }
}
