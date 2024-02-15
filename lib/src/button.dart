import 'package:flutter/material.dart';


class CustomButton extends StatefulWidget{

  MaterialStateProperty<Color?>? bgColor;
  MaterialStateProperty<Color?>? textColor;
  String text;
  double? rounded;
  Function onPressed; 
CustomButton({this.bgColor,this.textColor,required this.text,this.rounded,required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: widget.onPressed(), child: Text(widget.text),style: ButtonStyle(backgroundColor: widget.bgColor),);
  }
}