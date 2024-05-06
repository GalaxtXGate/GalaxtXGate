import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galaxyxgate/core/data/models/user.dart';

class AppGeneral {
  static ValueNotifier<bool> noConnection = ValueNotifier<bool>(false);

  static ValueNotifier<GalaxyUser?> user = ValueNotifier<GalaxyUser?>(null);

  static bool? notFirstTime;
}
