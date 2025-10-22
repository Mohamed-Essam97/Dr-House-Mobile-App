import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/notifications_screen/widgets/notification_card.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allowNotifications = useState(false);
    return Scaffold(
      appBar: CustomAppBar(
        title: const TextUtils('Notifications'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: UIColor.kLightGrey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: PopupMenuButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(Assets.icons.popupMenuIcon.path),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextUtils(
                      'Mark all as read',
                      style: context.regular(size: 12),
                    ),
                    onTap: () {
                      // Add logic to mark all notifications as read
                    },
                  ),
                  PopupMenuItem(
                    height: 24,
                    child: StatefulBuilder(
                      builder: (context, setState) => Row(
                        children: [
                          TextUtils(
                            'Allow notifications',
                            style: context.regular(size: 12),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: allowNotifications.value,
                              trackColor: UIColor.kAuthBackGround,
                              activeColor: UIColor.kPrimaryLight,
                              onChanged: (value) {
                                allowNotifications.value = value;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 10, // Replace with your notifications list length
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: NotificationCard(
              title: 'Notification Title $index',
              description:
                  'Order number #50445632001 will arrive you tomorrow. $index',
              isRead: index % 2 == 0, // Example logic for read/unread
            ),
          );
        },
      ),
    );
  }
}
