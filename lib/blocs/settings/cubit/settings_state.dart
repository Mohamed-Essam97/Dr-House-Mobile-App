import 'package:flutter/material.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/theme_cubit.dart';

class SettingsState {
  String locale = 'en';
  ThemeCubit? theme;
  String appVersion = '';
  String buildNumber = '';

  TextDirection get textDirection =>
      locale == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  SettingsState copyWith({
    String? locale,
    String? theme,
    String? appVersion,
    String? buildNumber,
  }) {
    return SettingsState()
      ..locale = locale ?? this.locale
      ..appVersion = appVersion ?? this.appVersion
      ..buildNumber = buildNumber ?? this.buildNumber;
  }
}
