import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String body;
  final String type;
  @override
  const NotificationWidget({
    super.key,
    required this.title,
    required this.body,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //       color: UIColor.kPrimary,
              //       borderRadius: BorderRadius.circular(12)),
              //   child: Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: SvgPicture.asset(
              //       Assets.icons.notification.path,
              //     ),
              //   ),
              // ),
              // Gap(24),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: UIColor.kPrimaryLight),
                  ),
                  const Gap(12),
                  TextUtils(
                    body,
                    shouldTrim: false,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const Gap(12),
                  NormalButton(
                    height: 40,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Close",
                    textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: UIColor.kPrimaryLight),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
