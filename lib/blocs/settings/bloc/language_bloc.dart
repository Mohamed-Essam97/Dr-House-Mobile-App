import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  static const supportedLocales = ['en', 'ar', 'de'];

  LanguageCubit() : super(const LanguageState(translations: {}, locale: 'en')) {
    changeLanguage('en');
  }

  Future<void> changeLanguage(String selectedLanguage) async {
    try {
      final translations = await _loadTranslations(selectedLanguage);
      emit(LanguageState(translations: translations, locale: selectedLanguage));
    } catch (e) {
      emit(LanguageState(translations: const {}, locale: selectedLanguage));
    }
  }

  Future<Map<String, String>> _loadTranslations(String locale) async {
    final String jsonString =
        await rootBundle.loadString('assets/lang/$locale.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return state.translations[key] ?? key;
  }

  @override
  Map<String, dynamic> toJson(LanguageState state) {
    return {
      'translations': state.translations,
      'locale': state.locale,
    };
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    return LanguageState(
      translations: Map<String, String>.from(json['translations'] as Map),
      locale: json['locale'] as String?,
    );
  }
}
