import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void navigateTo(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }

  void navigateToAndRemoveUntil(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void navigateToAndReplace(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void navigateBack() {
    Navigator.of(this).pop();
  }

  void navigateBackUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}
