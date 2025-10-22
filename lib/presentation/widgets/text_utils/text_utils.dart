import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/bloc/language_bloc.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';

class TextUtils extends HookWidget {
  final String text;
  final TextStyle? style;
  final bool shouldTrim;
  final int trimLines;
  final int trimLength; // Trim by character count
  final TextAlign textAlign;

  const TextUtils(
    this.text, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
    this.shouldTrim = true, // By default, trimming is on
    this.trimLines = 1, // Default is 1 line for line-based trimming
    this.trimLength = 100, // Default character length limit
  });

  @override
  Widget build(BuildContext context) {
    final languageBloc = context.read<LanguageCubit>();

    // If shouldTrim is true, trim text based on character count
    String displayText = shouldTrim && text.length > trimLength
        ? '${text.substring(0, trimLength)}...'
        : text;

    return Text(
      languageBloc.translate(displayText),
      style: style ?? context.medium(size: 19),
      textAlign: textAlign,
      maxLines: shouldTrim ? trimLines : null, // Trim based on lines if needed
      overflow: shouldTrim ? TextOverflow.ellipsis : TextOverflow.visible,
    );
  }
}
