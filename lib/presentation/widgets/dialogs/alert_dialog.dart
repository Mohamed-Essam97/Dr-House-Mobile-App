import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class CustomAlertDialog extends StatelessWidget {
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomAlertDialog({
    super.key,
    required this.description,
    this.buttonText = 'Continue',
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            Image.asset(
              Assets.images.error.path,
              height: 80,
            ),

            const Gap(16),
            // Description
            TextUtils(
              description,
              shouldTrim: false,
              style: context.medium(size: 19, color: UIColor.kGrey),
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            // Button
            Row(
              children: [
                Expanded(
                  child: NormalButton(
                    onPressed: () {
                      context.pop();
                    },
                    text: "NO",
                    height: 44,
                    textStyle: context.regular(
                      size: 14,
                      color: UIColor.kDisabledTextGrey,
                    ),
                    color: UIColor.kLightGrey.withOpacity(0.2),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: NormalButton(
                    onPressed: onPressed,
                    text: "YES",
                    height: 44,
                    color: UIColor.kOpictyLight,
                    textStyle: context.regular(
                      size: 14,
                      color: UIColor.kPrimaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
