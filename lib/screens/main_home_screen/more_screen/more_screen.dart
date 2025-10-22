import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const TextUtils(''),
        leading: const SizedBox(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: IconButton(
              icon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: UIColor.kGrey, width: 0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(Assets.icons.settings.path),
                  )),
              onPressed: () {
                context.push(AppRouter.settingsScreen);
                // Handle settings
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // Profile Section
            const Center(
              child: CircleAvatar(radius: 45),
            ),
            const Gap(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils('ibrahim Shawki', style: context.semiBold(size: 19)),
                IconButton(
                  icon: SvgPicture.asset(Assets.icons.editProfile.path),
                  onPressed: () {
                    // Handle edit profile
                  },
                ),
              ],
            ),

            // Progress Section
            SizedBox(
              width: 200,
              height: 5,
              child: LinearProgressIndicator(
                value: 1,
                backgroundColor: UIColor.kLightGrey,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(height: 8),
            TextUtils('Your profile is 100% completed',
                style:
                    context.medium(size: 13, color: UIColor.kDisabledTextGrey)),

            // Menu Items
            const SizedBox(height: 32),
            _buildMenuItem(
              icon: Assets.icons.user.path,
              title: 'My Profile',
              onTap: () {},
              context: context,
            ),
            _buildMenuItem(
              icon: Assets.icons.review.path,
              title: 'My Reviews',
              onTap: () {},
              context: context,
            ),
            _buildMenuItem(
              icon: Assets.icons.question.path,
              title: 'Frequently Asked Questions',
              onTap: () {
                context.push(AppRouter.faqsScreen);
              },
              context: context,
            ),
            _buildMenuItem(
              icon: Assets.icons.info.path,
              title: 'About Us',
              onTap: () {
                context.push(AppRouter.aboutUsScreen);
              },
              context: context,
            ),
            _buildMenuItem(
              icon: Assets.icons.contract.path,
              title: 'Terms of Use',
              onTap: () {
                context.push(AppRouter.termsOfUseScreen);
              },
              context: context,
            ),
            _buildMenuItem(
              icon: Assets.icons.blog.path,
              title: 'Blog',
              onTap: () {
                context.push(AppRouter.blogsScreen);
              },
              context: context,
            ),
            _buildMenuItem(
              icon: Assets.icons.shareApp.path,
              title: 'Share App',
              onTap: () {},
              context: context,
            ),
            const Gap(12),
            NormalButton(
              onPressed: () {},
              text: "Logout",
              height: 50,
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          color: UIColor.kWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 4),
        child: ListTile(
          minTileHeight: 46,
          leading: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            color: UIColor.kPrimaryLight,
          ),
          title: TextUtils(title, style: context.medium(size: 14)),
          // trailing: const Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }
}
