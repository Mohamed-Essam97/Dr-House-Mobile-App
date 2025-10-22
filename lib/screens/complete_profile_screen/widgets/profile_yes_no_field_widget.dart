import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_cubit.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_state.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/input_decoration_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/quwstions.dart';

class ProfileYesOrNoTextFieldWidget extends StatelessWidget {
  const ProfileYesOrNoTextFieldWidget({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final initialValue = state.responses[question.id];
        return InputDecorator(
          decoration: MyInputDecorationTheme().getFilledDecoration(
            hint: question.text,
            context: context,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<bool>(
              value: initialValue,
              hint: TextUtils(
                question.text,
                style:
                    context.medium(size: 15, color: UIColor.kDisabledTextGrey),
              ),
              isExpanded: true,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: UIColor.kDisabledTextGrey,
              ),
              items: [
                DropdownMenuItem<bool>(
                  value: true,
                  child: TextUtils(
                    'Yes',
                    style: context.regular(size: 15),
                  ),
                ),
                DropdownMenuItem<bool>(
                  value: false,
                  child: TextUtils(
                    'No',
                    style: context.regular(size: 15),
                  ),
                ),
              ],
              onChanged: (value) =>
                  profileCubit.updateResponse(question.id, value),
              selectedItemBuilder: (BuildContext context) {
                return [
                  Row(
                    children: [
                      TextUtils(
                        "${question.text}  ",
                        style: context.medium(
                            size: 15, color: UIColor.kDisabledTextGrey),
                      ),
                      TextUtils(
                        '(Yes)',
                        style: context.regular(size: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextUtils(
                        "${question.text}  ",
                        style: context.medium(
                            size: 15, color: UIColor.kDisabledTextGrey),
                      ),
                      TextUtils(
                        '(No)',
                        style: context.regular(size: 15),
                      ),
                    ],
                  ),
                ];
              },
            ),
          ),
        );
      },
    );
  }
}
