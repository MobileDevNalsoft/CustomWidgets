import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'dart:math' as math;

class CustomWidgets {
  // ignore: non_constant_identifier_names
  static Widget CustomTextButton(
      {required VoidCallback onPressed,
      required String text,
      MaterialStateProperty<Color?>? bgColor,
      MaterialStateProperty<Color?>? textColor}) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: bgColor),
      child: Text(text),
    );
  }

  // customized elevated button
  // ignore: non_constant_identifier_names
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
    MaterialStateProperty<Color?>? foregroundColor =
        const MaterialStatePropertyAll(Colors.black),
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<Color?>? iconColor =
        const MaterialStatePropertyAll(Colors.black),
    MaterialStateProperty<Color?>? overlayColor =
        const MaterialStatePropertyAll(Colors.black12),
    MaterialStateProperty<Color?>? shadowColor =
        const MaterialStatePropertyAll(Colors.black),
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
          foregroundColor: foregroundColor,
          iconColor: iconColor,
          iconSize: iconSize,
          maximumSize: maximumSize,
          minimumSize: minimumSize,
          mouseCursor: mouseCursor,
          overlayColor: overlayColor,
          padding: padding,
          shadowColor: shadowColor,
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

  // ignore: non_constant_identifier_names
  static Widget CustomTextField(
      {String? hintText,
      prefixIcon,
      suffixIcon,
      TextEditingController? controller,
      bool? obscureText,
      double? width,
      double? borderRadius,
      double? verticalContentPadding,
      double? horizontalContentPadding,
      String? obscuringCharacter,
      Widget? label,
      TextStyle? textStyle}) {
    return Container(
      width: width ?? 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 5),
            BoxShadow(
              color: Colors.white,
            ),
          ]),
      child: TextFormField(
        style: textStyle,
        controller: controller,
        decoration: InputDecoration(
          label: label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalContentPadding ?? 12,
              horizontal: horizontalContentPadding ?? 16),
          hintStyle: TextStyle(color: Colors.black38),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        obscuringCharacter: obscuringCharacter ?? '*',
        obscureText: obscureText ?? false,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static CustomSnackBar(BuildContext context, String content, Color color) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor: color,
    ));
  }

  // ignore: non_constant_identifier_names
  static Widget CustomCircularLoader() {
    return const RiveAnimation.asset('assets/animations/logo.riv');
  }

  // ignore: non_constant_identifier_names
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
            key: key ?? GlobalKey(),
            content: SingleChildScrollView(child: child),
          );
        });
  }

  // ignore: non_constant_identifier_names
  static Widget CustomExpandableFAB({
    Color? color,
    bool? initialOpen,
    double distance = 55,
    required List<Widget> children,
  }) {
    return ExpandableFAB(
      initialOpen: initialOpen,
      distance: distance,
      children: children,
      color: color,
    );
  }

  // ignore: non_constant_identifier_names
  static Widget CustomActionButton(
      {required Widget icon,
      Key? key,
      void Function()? onPressed,
      Color? color}) {
    return ActionButton(
        icon: icon, key: key, onPressed: onPressed, color: color);
  }
}

//----------------CustomExpandedFAB-------------------//

@immutable
class ExpandableFAB extends StatefulWidget {
  const ExpandableFAB(
      {super.key,
      this.initialOpen,
      this.color,
      required this.distance,
      required this.children});

  final bool? initialOpen;
  final Color? color;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFAB> createState() => _ExpandableFABState();
}

class _ExpandableFABState extends State<ExpandableFAB>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFAB(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFAB()
        ],
      ),
    );
  }

  Widget _buildTapToCloseFAB() {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: Material(
          color: widget.color,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(_ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i]));
    }
    return children;
  }

  Widget _buildTapToOpenFAB() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(_open ? 0.7 : 1, _open ? 0.7 : 1, 1),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: SizedBox(
            height: 50,
            width: 50,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: widget.color,
              onPressed: _toggle,
              child: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton(
      {required this.directionInDegrees,
      required this.maxDistance,
      required this.progress,
      required this.child});

  final double
      directionInDegrees; // give offset values based on children to get them in straight
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
            directionInDegrees * (math.pi / 180),
            progress.value *
                maxDistance); // can modify here to get in straignt line
        return Positioned(
            right: 4.0 + offset.dx,
            bottom: 4.0 + offset.dy,
            child: Transform.rotate(
              angle: (1.0 - progress.value) * math.pi / 2,
              child: child!,
            ));
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key, this.onPressed, required this.icon, this.color});

  final VoidCallback? onPressed;
  final Widget icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: color,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
