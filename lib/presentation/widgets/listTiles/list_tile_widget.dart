import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/theme_colors.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class listTileWidget extends HookWidget {
  final String? title;
  final VoidCallback onPressed;
  final Color? color;
  final bool visible;

  const listTileWidget({
    super.key,
    this.title,
    this.color,
    required this.onPressed,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: ListTile(
              onTap: onPressed,
              title: TextUtils(
                title!,
                style: context.bodyMedium!.copyWith(
                  color: color ?? context.primary,
                  fontSize: 12,
                ),
              ))),
    );
  }
}
