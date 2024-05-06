// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:galaxyxgate/core/helpers/cache_helper.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const ChangeLang(Locale('en')));

  changeLang({required BuildContext context, required Locale locale}) {
    context.setLocale(locale);
    CacheHelper.saveData(key: "local", value: locale.languageCode);
  }

  Locale getSavedLang({required BuildContext context}) {
    if (CacheHelper.getData(key: "local") != null) {
      return Locale(CacheHelper.getData(key: "local"));
    } else {
      return context.supportedLocales[0];
    }
  }
}
