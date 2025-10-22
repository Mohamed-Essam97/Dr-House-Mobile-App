import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/custom_forms/reactive_widgets.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/dialogs/success_dialog.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/widgets/pin_bottom_sheet.dart';
import 'package:reactive_forms/reactive_forms.dart';
// Import other necessary files

class ResetPasswordScreen extends HookWidget {
  const ResetPasswordScreen({super.key});

  FormGroup buildForm() {
    return fb.group({
      'password': [
        '',
        // Validators.compose([
        //   Validators.required,
        //   Validators.minLength(6),
        //   // Add any other password requirements
        // ])
      ],
      'confirmPassword': [
        '',
        // Validators.required,
      ]
    }, [
      Validators.mustMatch('password', 'confirmPassword')
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.kAuthBackGround,
      appBar: const CustomAppBar(
        title: TextUtils('Reset Password'),
      ),
      body: SafeArea(
        child: ReactiveFormBuilder(
          form: buildForm,
          builder: (context, form, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  // Description
                  TextUtils(
                    'Please enter new password and confirm it',
                    style:
                        context.regular(size: 15, color: UIColor.kTextDarkGrey),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(20),
                  // Password Field
                  ReactiveField(
                    controllerName: 'password',
                    hint: 'New Password',
                    type: ReactiveFields.PASSWORD,
                    textInputAction: TextInputAction.next,
                    validationMesseges: {
                      'required': (error) => 'Password is required',
                      'minLength': (error) =>
                          'Password must be at least 6 characters',
                    },
                  ),
                  const Gap(14),
                  // Confirm Password Field
                  ReactiveField(
                    controllerName: 'confirmPassword',
                    hint: 'Confirm Password',
                    type: ReactiveFields.PASSWORD,
                    textInputAction: TextInputAction.done,
                    validationMesseges: {
                      'required': (error) => 'Please confirm your password',
                      'mustMatch': (error) => 'Passwords do not match',
                    },
                  ),
                  // Password Requirements
                  // ReactiveFormConsumer(
                  //   builder: (context, form, child) {
                  //     final password =
                  //         form.control('password').value?.toString() ?? '';

                  //     return Container(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           TextUtils(
                  //             'Password must contain:',
                  //             style: context.bodyMedium,
                  //           ),
                  //           const SizedBox(height: 8),
                  //           _buildRequirement(
                  //             context,
                  //             'At least 6 characters',
                  //             password.length >= 6,
                  //           ),
                  //           _buildRequirement(
                  //             context,
                  //             'At least one uppercase letter',
                  //             RegExp(r'[A-Z]').hasMatch(password),
                  //           ),
                  //           _buildRequirement(
                  //             context,
                  //             'At least one number',
                  //             RegExp(r'[0-9]').hasMatch(password),
                  //           ),
                  //           _buildRequirement(
                  //             context,
                  //             'At least one special character',
                  //             RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                  //                 .hasMatch(password),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  const SizedBox(height: 16),
                  // Reset Button
                  ReactiveFormConsumer(
                    builder: (context, form, child) {
                      return NormalButton(
                        onPressed: () {
                          // if (form.valid) {
                          _onSubmit(context, form);
                          // }
                        },
                        text: 'Save',
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRequirement(BuildContext context, String text, bool isDone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(
            isDone ? Icons.check_circle : Icons.check_circle_outline,
            size: 16,
            color: isDone ? UIColor.kPrimaryLight : UIColor.kGrey,
          ),
          const SizedBox(width: 8),
          TextUtils(
            text,
            style: context.bodyMedium?.copyWith(
              color: isDone ? UIColor.kPrimaryLight : UIColor.kGrey,
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmit(BuildContext context, FormGroup form) {
    final password = form.control('password').value as String;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      barrierColor: UIColor.kLightGrey.withOpacity(0.9),
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: PinBottomSheet(
          onPinComplete: (pin) {
            context.pop();
            _showSuccessDialog(context);
          },
          title: 'VERIFY PHONE NUMBER',
          description: 'Enter 5-digit Code code we have sent to at ',
          sendTo: '+49 176 72551758',
          resendOnTap: () {},
        ),
      ),
    );
  }

  _showSuccessDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => SuccessDialog(
        title: 'Congratulations!',
        onPressed: () {
          context.pop();
          context.push(AppRouter.patientQuestionsScreen);
        },
        description:
            'Your password has been reset. You will be redirected to the login poge in a few seconds.',
        buttonText: 'BACK TO LOGIN PAGE',
      ),
    );
  }
}
