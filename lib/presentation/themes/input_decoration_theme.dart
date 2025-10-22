import 'package:flutter/material.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';

class MyInputDecorationTheme {
  // A method that returns InputDecorationTheme to pass it to the inputDecorationTheme
  // property of the ThemeData Class  in main.dart

  // final navigatorContext = navigatorKey.currentState?.context;

  InputDecorationTheme myInputDecorationTheme() => InputDecorationTheme(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        disabledBorder: _underlineInputBorder(UIColor.kPrimaryLight),
        enabledBorder: _underlineInputBorder(UIColor.kPrimaryLight),
        focusedBorder: _underlineInputBorder(UIColor.kPrimaryLight),
        errorBorder: _underlineInputBorder(UIColor.kError),
        focusedErrorBorder: _underlineInputBorder(UIColor.kError),
        errorStyle: _buildTextStyle(UIColor.kError),
      );

  UnderlineInputBorder _underlineInputBorder(Color color) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
      );

  OutlineInputBorder outLineInputBorder(Color color) => OutlineInputBorder(
          borderSide: BorderSide(
        color: color,
        width: 1.0,
      ));

  TextStyle _buildTextStyle(Color color, {double fontSize = 16}) => TextStyle(
        color: color,
        fontSize: fontSize,
      );

  InputDecoration getFilledDecoration({
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
    required BuildContext context,
    bool isNumber = false,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: context.medium(size: 15, color: UIColor.kDisabledTextGrey),
      suffixStyle: context.medium(size: 15, color: UIColor.kDisabledTextGrey),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      errorStyle: context.errorText!.copyWith(color: UIColor.kError),
      labelStyle: context.label,
      filled: false,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: UIColor.kGrey, width: 0.4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: UIColor.kGrey, width: 0.4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: UIColor.kGrey, width: 0.4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: UIColor.kError, width: 0.4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: UIColor.kError, width: 0.4),
      ),
    );
  }
}
