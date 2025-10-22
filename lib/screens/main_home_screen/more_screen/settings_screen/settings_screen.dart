import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool newPostsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: TextUtils('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils('General', style: context.medium(size: 18)),
            const Gap(24),
            // Change Password Button
            InkWell(
              onTap: () {
                context.push(AppRouter.changePassword);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      'Change Password',
                      style: context.regular(size: 14),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: UIColor.kGrey,
                    ),
                  ]),
            ),
            const Divider(
              thickness: 0.2,
              color: UIColor.kGrey,
            ),
            const Gap(4),
            // Change Language Button
            InkWell(
              onTap: () {
                context.push(AppRouter.changeLanguage);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      'Change language',
                      style: context.regular(size: 14),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: UIColor.kGrey,
                    ),
                  ]),
            ),
            const Divider(
              thickness: 0.2,
              color: UIColor.kGrey,
            ),
            const SizedBox(height: 20),

            TextUtils(
              "Notifications",
              style: context.medium(size: 18),
            ),
            // Notifications Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils(
                  'Appointments',
                  style: context.regular(size: 14),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: notificationsEnabled,
                    trackColor: UIColor.kAuthBackGround,
                    activeColor: UIColor.kPrimaryLight,
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            // New Posts Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils(
                  'New posts',
                  style: context.regular(size: 14),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: newPostsEnabled,
                    trackColor: UIColor.kAuthBackGround,
                    activeColor: UIColor.kPrimaryLight,
                    onChanged: (value) {
                      setState(() {
                        newPostsEnabled = value;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
