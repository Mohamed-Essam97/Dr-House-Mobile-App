import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/widgets/form_widget.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    super.key,
    required this.currentStep,
    required this.responses,
    required this.steps,
  });

  final ValueNotifier<int> currentStep;
  final ValueNotifier<Map<String, dynamic>> responses;
  final List<StepData> steps;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: EasyStepper(
        titlesAreLargerThanSteps: false,
        showTitle: false,
        internalPadding: 0,
        padding: EdgeInsets.zero,
        activeStep: currentStep.value,
        stepShape: StepShape.circle,
        activeStepBackgroundColor: UIColor.kPrimaryLight,
        activeStepBorderColor: UIColor.kPrimaryLight,
        activeStepIconColor: UIColor.kPrimaryLight,
        showLoadingAnimation: false,
        showStepBorder: false,
        stepRadius: 6,
        lineStyle: LineStyle(
          lineSpace: 4,
          lineType: LineType.normal,
          lineLength: 55,
          defaultLineColor: Colors.grey,
          finishedLineColor: Theme.of(context).primaryColor,
        ),
        steps: List.generate(
          steps.length,
          (index) {
            return EasyStep(
              customStep: Container(
                decoration: BoxDecoration(
                  color: currentStep.value >= index
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              topTitle: true,
            );
          },
        ),
        onStepReached: (index) => currentStep.value = index,
      ),
    );
  }
}
