import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/theme_colors.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class ActionChipWidget extends HookWidget {
  final int? index;
  final String? title;
  final int? currentSelectedIndex;
  final VoidCallback? voidCallback;

  const ActionChipWidget(
      {super.key,
      this.index,
      this.title,
      this.currentSelectedIndex,
      this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 0, end: 0),
      child: ActionChip(
        labelPadding: const EdgeInsetsDirectional.only(start: 25, end: 25),
        backgroundColor: currentSelectedIndex == index
            ? context.primaryColorLight
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(33),
        ),
        labelStyle:
            context.bodyLarge!.copyWith(color: Colors.white, fontSize: 10),
        onPressed: voidCallback!,
        elevation: 1,
        label: TextUtils(
          title!,
        ),
      ),
    );
  }
}
