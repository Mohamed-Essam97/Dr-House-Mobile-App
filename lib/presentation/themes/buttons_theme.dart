import 'package:flutter/material.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';

class ButtonsTheme {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      shadowColor: UIColor.kWhite,
      minimumSize: const Size(double.infinity, 10.0),
      backgroundColor: UIColor.kPrimaryLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: UIColor.kPrimaryLight, width: 1.0),
      minimumSize: const Size(double.infinity, 10.0),
      disabledForegroundColor: UIColor.kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );
}
