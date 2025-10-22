import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class SocialLoginButtonsWidget extends StatelessWidget {
  const SocialLoginButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        // // Social Login Options
        Row(
          children: [
            const Expanded(
              child: Divider(
                thickness: 0.4,
                color: UIColor.kGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextUtils(
                'Or',
                style: context.regular(size: 12, color: UIColor.kTextDarkGrey),
              ),
            ),
            const Expanded(
              child: Divider(
                thickness: 0.4,
                color: UIColor.kGrey,
              ),
            ),
          ],
        ),
        const Gap(12),

        OutlinedButton.icon(
          onPressed: () {
            // Handle Apple login
          },
          icon: SvgPicture.asset(Assets.icons.google.path),
          label: TextUtils(
            'Continue with Google',
            style: context.semiBold(size: 14),
          ),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            backgroundColor: Colors.white,
            side: BorderSide.none, // Removes the border
          ),
        ),
        const Gap(6),
        OutlinedButton.icon(
          onPressed: () {
            // Handle Apple login
          },
          icon: SvgPicture.asset(Assets.icons.apple.path),
          label: TextUtils(
            'Continue with Apple',
            style: context.semiBold(size: 14),
          ),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            backgroundColor: Colors.white,
            side: BorderSide.none, // Removes the border
          ),
        ),
      ],
    );
  }
}
