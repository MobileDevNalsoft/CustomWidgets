import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomWidgets {
  static Widget CustomTextButton(
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

  // customized elevated button
  static Widget CustomElevatedButton({
    GlobalKey? key,
    required VoidCallback onPressed,
    void Function()? onLongPress,
    void Function(bool)? onHover,
    void Function(bool)? onFocusChange,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    MaterialStatesController? statesController,
    required Widget child,
    MaterialStateProperty<TextStyle?>? textStyle,
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<Color?>? surfaceTintColor,
    MaterialStateProperty<double?>? elevation,
    MaterialStateProperty<EdgeInsetsGeometry?>? padding,
    MaterialStateProperty<Size?>? minimumSize,
    MaterialStateProperty<Size?>? fixedSize,
    MaterialStateProperty<Size?>? maximumSize,
    MaterialStateProperty<double?>? iconSize,
    MaterialStateProperty<BorderSide?>? side,
    MaterialStateProperty<OutlinedBorder?>? shape,
    MaterialStateProperty<MouseCursor?>? mouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    InteractiveInkFeatureFactory? splashFactory,
  }) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: ButtonStyle(
          alignment: Alignment.center,
          animationDuration: animationDuration,
          backgroundColor: backgroundColor,
          elevation: elevation,
          enableFeedback: enableFeedback,
          fixedSize: fixedSize,
          foregroundColor: MaterialStatePropertyAll(Colors.black),
          iconColor: MaterialStatePropertyAll(Colors.black),
          iconSize: iconSize,
          maximumSize: maximumSize,
          minimumSize: minimumSize,
          mouseCursor: mouseCursor,
          overlayColor: MaterialStatePropertyAll(Colors.black12),
          padding: padding,
          shadowColor: MaterialStatePropertyAll(Colors.black),
          shape: shape,
          side: side,
          splashFactory: splashFactory,
          surfaceTintColor: surfaceTintColor,
          tapTargetSize: tapTargetSize,
          textStyle: textStyle,
          visualDensity: visualDensity),
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      child: child,
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
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
    return RiveAnimation.asset('assets/animations/logo.riv');
  }

  static CustomDialogBox({
    required BuildContext context,
    required Widget? child,
    Key? key,
    List<Widget>? actions,
    Color? backgroundColor,
    EdgeInsetsGeometry? iconPadding,
    Widget? title,
    Widget? icon,
    Color? iconColor,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    Clip? clipBehavior,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    bool? scrollable,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: actions,
            title: title,
            actionsAlignment: actionsAlignment,
            actionsOverflowAlignment: actionsOverflowAlignment,
            actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
            actionsOverflowDirection: actionsOverflowDirection,
            actionsPadding: actionsPadding,
            alignment: alignment,
            buttonPadding: buttonPadding,
            clipBehavior: clipBehavior ?? Clip.none,
            contentPadding: contentPadding,
            contentTextStyle: contentTextStyle,
            elevation: elevation,
            iconColor: iconColor,
            iconPadding: actionsPadding,
            scrollable: scrollable ?? true,
            semanticLabel: semanticLabel,
            titlePadding: titlePadding,
            titleTextStyle: titleTextStyle,
            shadowColor: shadowColor ?? Colors.black,
            shape: shape,
            surfaceTintColor: surfaceTintColor,
            icon: icon,
            backgroundColor: backgroundColor ?? Colors.white,
            key: key??GlobalKey(),
            content: SingleChildScrollView(child: child),
          );
        });
  }

}


  