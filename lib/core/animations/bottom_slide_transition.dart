import 'package:flutter/material.dart';

class BottomSlideTransition extends PageRouteBuilder {
  final Widget page;
  BottomSlideTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset begin = const Offset(0, 1);
            Offset end = const Offset(0, 0);
            Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);
            CurvedAnimation curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.decelerate,
            );
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
        );
}
