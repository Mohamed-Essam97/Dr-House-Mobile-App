import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_outline_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth;

class OnboardingScreen extends HookWidget {
  bool isLastPage = false;

  final List<OnboardingItem> items = [
    OnboardingItem(
      image: Assets.images.onboarding1.path,
      title: 'Stay on Top of Your Health!',
      description:
          'Effortlessly manage your appointments and never miss a visit with our timely reminders.',
    ),
    OnboardingItem(
      image: Assets.images.onboarding2.path,
      title: 'Connect with Top Specialists',
      description:
          'Access a network of trusted healthcare professionals across various specialties.',
    ),
    OnboardingItem(
      image: Assets.images.onboarding3.path,
      title: 'Your Health Records in One Place',
      description:
          'Easily view, manage, and share your medical history from the convenience of your phone.',
    ),
  ];

  OnboardingScreen({super.key});

  Widget _buildImage(int index) {
    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(44)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            UIColor.kPrimaryLight,
            UIColor.kPrimaryDark,
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(44)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Image.asset(
              items[index].image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(int index, BuildContext context) {
    return Column(
      children: [
        TextUtils(
          items[index].title,
          shouldTrim: false,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextUtils(
            items[index].description,
            shouldTrim: false,
            textAlign: TextAlign.center,
            style: context.description,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              _buildImage(index.value),
            ],
          ),
          Column(
            children: [
              _buildText(index.value, context),
              const Gap(36),
              smooth.AnimatedSmoothIndicator(
                activeIndex: index.value,
                count: items.length,
                effect: const smooth.WormEffect(
                  spacing: 8,
                  dotColor: UIColor.kGrey,
                  activeDotColor: UIColor.kPrimaryLight,
                  dotWidth: 7,
                  dotHeight: 7,
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomOutLineButton(
                        onPressed: () {
                          if (index.value > 0) {
                            index.value--;
                          }
                        },
                        text: 'Skip',
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      child: NormalButton(
                        onPressed: () {
                          if (index.value < items.length - 1) {
                            index.value++;
                          } else {
                            context.push(AppRouter.loginScreen);
                          }
                        },
                        text: "Next",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
