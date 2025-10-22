import 'package:flutter/material.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CharacterCounter extends StatelessWidget {
  final String controlName;
  final int maxLength;
  final TextStyle? style;

  const CharacterCounter({
    super.key,
    required this.controlName,
    required this.maxLength,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        final value = form.control(controlName).value as String? ?? '';
        final remainingChars = maxLength - value.length;
        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: TextUtils(
            remainingChars > 0
                ? '$remainingChars characters remaining'
                : 'Maximum length reached',
            style: style ??
                context.bodyLarge!.copyWith(
                  fontSize: 12,
                  color: UIColor.kPrimaryLight,
                ),
          ),
        );
      },
    );
  }
}
