import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class SuccessBookAppointmentDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const SuccessBookAppointmentDialog({
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
              style: context.medium(size: 13, color: UIColor.kDisabledTextGrey),
              textAlign: TextAlign.center,
            ),
            const Gap(16),

            // Booking ID Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils(
                  'Booking ID',
                  style: context.medium(size: 15, color: UIColor.kTextDarkGrey),
                ),
                TextUtils(
                  '#12345', // Replace with actual booking ID
                  style: context.medium(size: 15),
                ),
              ],
            ),
            const Divider(
              thickness: 0.4,
              height: 28,
              color: UIColor.kGrey,
            ), // Date Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils(
                  'Date',
                  style: context.medium(size: 15, color: UIColor.kTextDarkGrey),
                ),
                TextUtils(
                  '12 Mar 2024', // Replace with actual date
                  style: context.medium(size: 15),
                ),
              ],
            ),
            const Divider(
              thickness: 0.4,
              height: 28,
              color: UIColor.kGrey,
            ), // D
            // Time Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils(
                  'Time',
                  style: context.medium(size: 15, color: UIColor.kTextDarkGrey),
                ),
                TextUtils(
                  '10:30 AM', // Replace with actual time
                  style: context.medium(size: 15),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
