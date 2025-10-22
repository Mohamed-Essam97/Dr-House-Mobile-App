import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_cubit.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/input_decoration_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/quwstions.dart';

class ProfileTextFieldWidget extends HookWidget {
  const ProfileTextFieldWidget({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: _ProfileTextFieldContent(question: question),
    );
  }
}

class _ProfileTextFieldContent extends HookWidget {
  const _ProfileTextFieldContent({
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final initialValue = context.select(
      (ProfileCubit cubit) =>
          cubit.state.responses[question.id]?.toString() ?? '',
    );

    final controller = useMemoized(
      () => TextEditingController(text: initialValue),
      [question.id],
    );

    useEffect(() {
      controller.text = initialValue;
      return null;
    }, [initialValue]);

    return TextFormField(
      controller: controller,
      onChanged: (value) {
        context.read<ProfileCubit>().updateResponse(question.id, value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: context.medium(size: 15),
      decoration: MyInputDecorationTheme().getFilledDecoration(
        hint: question.text,
        context: context,
        suffixIcon:
            question.icon != null ? SvgPicture.asset(question.icon!) : null,
      ),
    );
  }
}
