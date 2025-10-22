import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/custom_forms/reactive_widgets.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  FormGroup buildForm() {
    return fb.group({
      'oldPassword': [
        '',
        // Validators.compose([
        //   Validators.required,
        //   Validators.minLength(6),
        //   // Add any other password requirements
        // ])
      ],
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
        title: TextUtils('Change Password'),
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
                    'Please enter a old password and a new password and confirm it.',
                    style:
                        context.regular(size: 15, color: UIColor.kTextDarkGrey),
                    textAlign: TextAlign.start,
                    shouldTrim: false,
                  ),
                  const Gap(20),
                  // Password Field
                  ReactiveField(
                    controllerName: 'oldPassword',
                    hint: 'Old Password',
                    type: ReactiveFields.PASSWORD,
                    textInputAction: TextInputAction.next,
                    validationMesseges: {
                      'required': (error) => 'Password is required',
                      'minLength': (error) =>
                          'Password must be at least 6 characters',
                    },
                  ),
                  const Gap(12),

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
                  const Gap(12),
                  // Confirm Password Field
                  ReactiveField(
                    controllerName: 'confirmPassword',
                    hint: 'Confirm New Password',
                    type: ReactiveFields.PASSWORD,
                    textInputAction: TextInputAction.done,
                    validationMesseges: {
                      'required': (error) => 'Please confirm your password',
                      'mustMatch': (error) => 'Passwords do not match',
                    },
                  ),

                  const SizedBox(height: 16),
                  // Reset Button
                  ReactiveFormConsumer(
                    builder: (context, form, child) {
                      return NormalButton(
                        onPressed: () {
                          // if (form.valid) {
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
}
