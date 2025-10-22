import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_cubit.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_state.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/input_decoration_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/quwstions.dart';

class ProfileDateFieldWidget extends StatelessWidget {
  const ProfileDateFieldWidget({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profileCubit = context.read<ProfileCubit>();
        final initialValue = state.responses[question.id] is String
            ? DateTime.tryParse(state.responses[question.id])
            : state.responses[question.id];

        return TextField(
          readOnly: true,
          controller: TextEditingController(
            text: initialValue?.toString().split(' ')[0] ?? '',
          ),
          style: context.medium(size: 15),
          decoration: MyInputDecorationTheme().getFilledDecoration(
            hint: question.text,
            context: context,
            suffixIcon: question.icon != null
                ? InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: initialValue ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        profileCubit.updateResponse(question.id, picked);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(
                        question.icon!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : null,
          ),
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: initialValue ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              profileCubit.updateResponse(question.id, picked);
            }
          },
        );
      },
    );
  }
}
