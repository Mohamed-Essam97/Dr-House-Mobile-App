import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_cubit.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_state.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/input_decoration_theme.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/quwstions.dart';

class ProfileTextFieldNumberWidget extends HookWidget {
  const ProfileTextFieldNumberWidget({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final controller = useTextEditingController();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final value = state.responses[question.id]?.toString();
        if (value != null && controller.text != value) {
          controller.text = value;
        }

        return TextField(
          controller: controller,
          decoration: MyInputDecorationTheme().getFilledDecoration(
            hint: question.text,
            context: context,
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) => profileCubit.updateResponse(question.id, value),
        );
      },
    );
  }
}
