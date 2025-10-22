import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/blocs/profile/profile_cubit.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_outline_button.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/quwstions.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/add_profile_picture_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/profile_date_field_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/profile_multi_choice_field_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/profile_number_field_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/profile_text_field_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/profile_yes_no_field_widget.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/stepper_widget.dart';

class DynamicForm extends HookWidget {
  final Map<String, dynamic>? initialValues;

  const DynamicForm({
    super.key,
    this.initialValues,
  });

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    final responses = useState<Map<String, dynamic>>(initialValues ?? {});
    final currentStep = useState(0);
    final availableSpaceKey = GlobalKey();

    // Memoize steps and add logging
    final steps = useMemoized(() {
      final builtSteps = _buildSteps(context, responses, availableSpaceKey);
      print('Total steps: ${builtSteps.length}');
      return builtSteps;
    }, [responses.value]);

    void onStepContinue() {
      print('Current step: ${currentStep.value}, Total steps: ${steps.length}');
      if (currentStep.value < steps.length - 1) {
        currentStep.value++;
      } else {
        // Handle submission
        print("User Responses: ${responses.value}");
        profileCubit.submitProfile();
      }
    }

    void onStepCancel() {
      if (currentStep.value > 0) {
        currentStep.value--;
      }
    }

    // Ensure currentStep never exceeds steps length
    if (currentStep.value >= steps.length) {
      currentStep.value = steps.length - 1;
    }

    return Column(
      children: [
        StepperWidget(
          currentStep: currentStep,
          responses: responses,
          steps: steps,
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                key: availableSpaceKey,
                child: Column(
                  children: steps[currentStep.value].content,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentStep.value > 0)
                Expanded(
                  child: CustomOutLineButton(
                    onPressed: onStepCancel,
                    text: 'Back',
                  ),
                ),
              const Gap(8),
              Expanded(
                child: NormalButton(
                  onPressed: onStepContinue,
                  text:
                      currentStep.value < steps.length - 1 ? "Next" : "Submit",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<StepData> _buildSteps(
    BuildContext context,
    ValueNotifier<Map<String, dynamic>> responses,
    GlobalKey availableSpaceKey) {
  List<StepData> steps = [];

  // Get the actual height of the available space
  final RenderBox? renderBox =
      availableSpaceKey.currentContext?.findRenderObject() as RenderBox?;
  final availableHeight = renderBox?.size.height ?? 0;

  // Calculate number of questions that can fit
  // Each question takes 48 height + 7 vertical padding (55 total)
  final questionsPerStep = availableHeight > 0
      ? ((availableHeight - 48) ~/ 55).clamp(5, 10) // Min 5, Max 10 questions
      : 7; // Default fallback if height calculation fails

  // First step with profile photo and 7 questions
  steps.add(
    StepData(
      content: [
        const AddProfilePictureWidget(),
        const SizedBox(height: 20),
        ...questions.take(6).map((question) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 48,
                child: _buildInputField(context, question, responses),
              ),
            )),
      ],
    ),
  );

  // Remaining steps with dynamic number of questions
  for (int i = 7; i < questions.length; i += questionsPerStep) {
    steps.add(
      StepData(
        content: questions
            .skip(i)
            .take(questionsPerStep)
            .map((question) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 48,
                    child: _buildInputField(context, question, responses),
                  ),
                ))
            .toList(),
      ),
    );
  }
  return steps;
}

Widget _buildInputField(BuildContext context, Question question,
    ValueNotifier<Map<String, dynamic>> responses) {
  switch (question.inputType) {
    case 'text':
      return ProfileTextFieldWidget(
        question: question,
      );
    case 'number':
      return ProfileTextFieldNumberWidget(
        question: question,
      );
    case 'yes_no':
      return ProfileYesOrNoTextFieldWidget(
        question: question,
      );
    case 'multiple_choice':
      return ProfileMultipleChoiceFieldWidget(
        question: question,
      );
    case 'date':
      return ProfileDateFieldWidget(
        question: question,
      );
    default:
      return const SizedBox.shrink();
  }
}

class StepData {
  final List<Widget> content;

  StepData({required this.content});
}
