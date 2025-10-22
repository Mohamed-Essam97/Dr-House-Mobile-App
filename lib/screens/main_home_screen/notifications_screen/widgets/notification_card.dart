import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isRead;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 7,
              height: 7,
              margin: const EdgeInsets.only(top: 9, right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isRead ? UIColor.kGrey : UIColor.kPrimaryLight,
              ),
            ),
            const Gap(4),
            Expanded(
              child: Opacity(
                opacity: isRead ? 0.5 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      title,
                      shouldTrim: false,
                      style: context.medium(size: 15),
                    ),
                    const Gap(9),
                    TextUtils(
                      description,
                      shouldTrim: false,
                      style: context.regular(
                          size: 13, color: UIColor.kTextDarkGrey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
