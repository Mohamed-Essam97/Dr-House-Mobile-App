import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/bloc/language_bloc.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:sizer/sizer.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String selectedLanguage = 'en'; // Default language

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(17.h),
                      TextUtils(
                        'please_select_your_language',
                        style: context.medium20,
                      ),
                      const Gap(60),
                      _buildLanguageCard(
                        flag: Assets.icons.english.path,
                        language: 'English',
                        value: 'en',
                      ),
                      const SizedBox(height: 21),
                      _buildLanguageCard(
                        flag: Assets.icons.germany.path,
                        language: 'Deutsche',
                        value: 'de',
                      ),
                      const SizedBox(height: 21),
                      _buildLanguageCard(
                        flag: Assets.icons.arabic.path,
                        language: 'Arabic',
                        value: 'ar',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: NormalButton(
                    onPressed: () {
                      context.pop();
                      // Navigator.pushReplacementNamed(
                      //     context, '/home'); // Or your next route
                    },
                    text: 'next',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageCard({
    required String flag,
    required String language,
    required String value,
  }) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Container(
          height: 53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: UIColor.kGrey, width: 0.5),
          ),
          child: RadioListTile<String>(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
            value: value,
            activeColor: UIColor.kPrimaryLight,
            fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return UIColor.kPrimaryLight;
              }
              return UIColor.kGrey;
            }),
            groupValue: state.locale,
            onChanged: (newValue) {
              if (newValue != null) {
                setState(() {
                  selectedLanguage = newValue;
                });
                context.read<LanguageCubit>().changeLanguage(newValue);
              }
            },
            title: Row(
              children: [
                const Gap(6),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SvgPicture.asset(
                      flag,
                      height: 20,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextUtils(language, style: context.semiBold15!),
                ),
              ],
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            selected: selectedLanguage == value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
