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
      {required double buttonHeight,
      required double buttonWidth,
      required String hintText,
      required List<String> items,
      MaterialStateProperty<Color?>? backgroundColor,
      void Function(String?)? onChanged}) {
    return CustomDropDownWidget(
      hintText: hintText,
      buttonHeight: buttonHeight,
      buttonWidth: buttonWidth,
      items: items,
      backgroundColor: backgroundColor,
      onChanged: onChanged,
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

//---------------Custom Drop Down Widget----------------//

typedef ValueChangedCallback = void Function(String? changedValue);

class CustomDropDownWidget extends StatefulWidget {
  bool isOpen = false;
  List<String> items;
  String? hintText;
  MaterialStateProperty<Color?>? backgroundColor;
  double buttonWidth;
  double buttonHeight;
  final ValueChangedCallback? onChanged;

  CustomDropDownWidget(
      {required this.items,
      this.hintText,
      this.backgroundColor,
      required this.buttonHeight,
      required this.buttonWidth,
      this.onChanged});

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: SizedBox(
          height: widget.items.length * 80,
          child: Stack(
            children: [
              SizedBox(
                  height: widget.buttonHeight,
                  width: widget.buttonWidth,
                  child: InkWell(
                    highlightColor: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        widget.isOpen = !widget.isOpen;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 212, 212, 212),
                                offset: Offset(0, 2),
                                blurRadius: 5),
                            BoxShadow(
                              color: Colors.white,
                            ),
                          ] // Optional styling
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.hintText ?? widget.items[0],
                              style: TextStyle(
                                  color: widget.items.any((element) =>
                                          element == widget.hintText)
                                      ? Colors.black
                                      : Colors.black45)),
                          widget.isOpen
                              ? Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                )
                        ],
                      ),
                    ),
                  )),
              Visibility(
                visible: widget.isOpen,
                child: Positioned(
                  top: widget.buttonHeight + 5, // Adjust offset as needed
                  left: 0.0,
                  width:
                      widget.buttonWidth, // Set width from the widget property
                  child: Container(
                      height: widget.items.length * 37,
                      padding: EdgeInsets.only(top: 10),
                      // Wrap the dropdown list in a container
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 212, 212, 212),
                                offset: Offset(0, 2),
                                blurRadius: 5),
                            BoxShadow(
                              color: Colors.white,
                            ),
                          ] // Optional styling
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.items
                            .map((e) => Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(e),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          widget.hintText = e;
                                          widget.isOpen = !widget.isOpen;
                                          if (widget.onChanged != null) {
                                            widget.onChanged!(e);
                                          }
                                        });
                                      },
                                    ),
                                    widget.items.last != e
                                        ? Divider(
                                            color: Color.fromARGB(
                                                255, 212, 212, 212),
                                            thickness: 2,
                                          )
                                        : SizedBox(
                                            height: 7,
                                          )
                                  ],
                                ))
                            .toList(),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

//---------------Custom Drop Down Widget----------------//
