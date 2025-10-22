import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.description,
    this.buttonText = 'Continue',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            SvgPicture.asset(
              Assets.icons.success.path,
            ),
            const Gap(8),
            // Title
            TextUtils(
              title,
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            // Description
            TextUtils(
              description,
              shouldTrim: false,
              style: context.description,
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            // Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: NormalButton(
                onPressed: onPressed,
                text: buttonText,
              ),
            ),
            const Gap(64),
          ],
        ),
      ),
    );
  }
}
