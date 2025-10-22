import 'package:flutter/material.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';

TextTheme defaultTextTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 32.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    inherit: true,
  ),
  headlineMedium: TextStyle(
    fontSize: 24.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    inherit: true,
  ),
  headlineSmall: TextStyle(
    fontSize: 20.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    inherit: true,
  ),
  displayLarge: TextStyle(
    fontSize: 18.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    inherit: true,
  ),
  displayMedium: TextStyle(
    fontSize: 15.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    inherit: true,
  ),
  bodyLarge: TextStyle(
    fontSize: 16.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    inherit: true,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    inherit: true,
  ),
  bodySmall: TextStyle(
    fontSize: 14.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    inherit: true,
    color: UIColor.kDarkGrey,
  ),
  labelLarge: TextStyle(
    fontSize: 12.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    inherit: true,
  ),
  labelMedium: TextStyle(
    fontSize: 17.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    inherit: true,
  ),
);

extension TextThemeExtension on BuildContext {
  String get _fontFamily {
    // Get the current locale
    final locale = Localizations.localeOf(this);

    // Use Codec font for Arabic, otherwise use Inter
    return locale.languageCode == 'ar' ? 'Codec' : 'Inter';
  }

  TextStyle? get heading1 =>
      Theme.of(this).textTheme.headlineLarge?.copyWith(fontFamily: _fontFamily);

  TextStyle? get heading2 => Theme.of(this)
      .textTheme
      .headlineMedium
      ?.copyWith(fontFamily: _fontFamily);

  TextStyle? get heading3 =>
      Theme.of(this).textTheme.headlineSmall?.copyWith(fontFamily: _fontFamily);

  TextStyle? get displayLarge =>
      Theme.of(this).textTheme.displayLarge?.copyWith(fontFamily: _fontFamily);

  TextStyle? get body =>
      Theme.of(this).textTheme.displayMedium?.copyWith(fontFamily: _fontFamily);

  TextStyle? get bodyLarge =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(fontFamily: _fontFamily);

  TextStyle? get bodyMedium =>
      Theme.of(this).textTheme.bodyMedium?.copyWith(fontFamily: _fontFamily);

  TextStyle? get description => Theme.of(this).textTheme.bodySmall?.copyWith(
        fontFamily: _fontFamily,
        fontSize: 14,
        color: UIColor.kTextDarkGrey,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get label =>
      Theme.of(this).textTheme.labelLarge?.copyWith(fontFamily: _fontFamily);

  TextStyle? get button =>
      Theme.of(this).textTheme.labelMedium?.copyWith(fontFamily: _fontFamily);

  TextStyle? get errorText =>
      Theme.of(this).textTheme.labelLarge?.copyWith(fontFamily: _fontFamily);

  TextStyle? get semiBold18 => Theme.of(this).textTheme.labelLarge?.copyWith(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get medium20 => Theme.of(this).textTheme.labelLarge?.copyWith(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get semiBold15 => Theme.of(this).textTheme.labelLarge?.copyWith(
        fontFamily: _fontFamily,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get bold32 => Theme.of(this).textTheme.labelLarge?.copyWith(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      );

  TextStyle? regular({
    double size = 14,
    Color? color,
  }) =>
      Theme.of(this).textTheme.labelLarge?.copyWith(
            fontFamily: _fontFamily,
            fontSize: size,
            fontWeight: FontWeight.w400,
            color: color,
          );

  TextStyle? medium({
    double size = 14,
    Color? color,
  }) =>
      Theme.of(this).textTheme.labelLarge?.copyWith(
            fontFamily: _fontFamily,
            fontSize: size,
            fontWeight: FontWeight.w500,
            color: color,
          );

  TextStyle? semiBold({
    double size = 14,
    Color? color,
  }) =>
      Theme.of(this).textTheme.labelLarge?.copyWith(
            fontFamily: _fontFamily,
            fontSize: size,
            fontWeight: FontWeight.w600,
            color: color,
          );

  TextStyle? bold({
    double size = 14,
    Color? color,
  }) =>
      Theme.of(this).textTheme.labelLarge?.copyWith(
            fontFamily: _fontFamily,
            fontSize: size,
            fontWeight: FontWeight.w700,
            color: color,
          );
}
