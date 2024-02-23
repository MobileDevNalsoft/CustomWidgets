import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Progress Bar'),
        ),
        body: Center(
          child: LoopAnimation(),
        ),
      ),
    );
  }
}

class LoopAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedLoop(
      child: AnimationDemo(),
    );
  }
}

class AnimatedLoop extends StatefulWidget {
  final Widget child;

  AnimatedLoop({required this.child});

  @override
  _AnimatedLoopState createState() => _AnimatedLoopState();
}

class _AnimatedLoopState extends State<AnimatedLoop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust duration as needed
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return widget.child;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(seconds: 1),
          top: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.2,
          child: TextLetterAnimation(
            letters: ['N', 'A', 'L'],
            staggerDuration: Duration(milliseconds: 200),
            isLeft: true,
          ),
        ),
        AnimatedPositioned(
          duration: Duration(seconds: 2),
          top: MediaQuery.of(context).size.height * 0.4,
          right: MediaQuery.of(context).size.width * 0.2,
          child: TextLetterAnimation(
            staggerDuration: Duration(milliseconds: 200),
            letters: ['S', 'O', 'F', 'T'],
            isLeft: false,
          ),
        ),
      ],
    );
  }
}

class TextLetterAnimation extends StatelessWidget {
  final List<String> letters;
  final Duration staggerDuration;
  final bool isLeft;

  const TextLetterAnimation({
    required this.letters,
    required this.staggerDuration,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        letters.length,
        (index) {
          return FutureBuilder(
            future: Future.delayed(staggerDuration * index),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: 2.5),
                  duration: Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    double angle = value * pi / 2; // 0 to pi
                    double yOffset = cos(angle); // Circular motion
                    double xOffset = sin(angle); // Circular motion
                    return Transform.translate(
                      offset: isLeft
                          ? Offset( (1 -xOffset) * MediaQuery.of(context).size.width*0.1 ,
                              -yOffset * MediaQuery.of(context).size.height * 0.05)
                          : Offset((-1 +xOffset) * MediaQuery.of(context).size.width*0.056 ,
                              -yOffset * MediaQuery.of(context).size.height * 0.05),
                      child: child,
                    );
                  },
                  child: Text(
                    letters[index],
                    style: TextStyle(fontSize: 32, color: Colors.red),
                  ),
                );
              } else {
                return Container(); // Placeholder widget during delay
              }
            },
          );
        },
      ),
    );
  }
}
