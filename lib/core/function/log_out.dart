import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/data/services/context_services.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';
import 'package:galaxyxgate/core/routes/routes.dart';

logOut() {
  CacheHelper.clearData();
  Navigator.pushNamedAndRemoveUntil(
      NavigationService.navigatorKey.currentContext!,
      Routes.signIn,
      (route) => false);
}
