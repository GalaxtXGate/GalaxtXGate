// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../helpers/app_localization/language_cache_helper.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<ChangeLocaleState> {
  LocalCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage({required String languageCode}) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
