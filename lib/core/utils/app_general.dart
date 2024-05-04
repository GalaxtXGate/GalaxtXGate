import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/data/models/user.dart';

class AppGeneral {
  static ValueNotifier<bool> noConnection = ValueNotifier<bool>(false);

  static GalaxyUser? user;

  static bool? notFirstTime;
}
