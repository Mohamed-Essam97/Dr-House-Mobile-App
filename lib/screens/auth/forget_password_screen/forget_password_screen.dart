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
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';
// Import other necessary files

class ForgetPasswordScreen extends HookWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = useMemoized(() => fb.group({
          'email': [
            '',
            // Validators.compose([Validators.required, Validators.email])
          ],
        }));

    return Scaffold(
      backgroundColor: UIColor.kAuthBackGround,
      appBar: const CustomAppBar(
        title: TextUtils('Forget Password'),
      ),
      body: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                // Title
                TextUtils(
                  "Confirm it's you",
                  style: context.semiBold(size: 20),
                  textAlign: TextAlign.center,
                ),
                const Gap(8),
                // Description
                TextUtils(
                  "Please verify your Email to continue",
                  style:
                      context.regular(size: 15, color: UIColor.kTextDarkGrey),
                  textAlign: TextAlign.center,
                ),
                const Gap(64),
                // Email Field

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      "Enter your email",
                      style: context.medium(size: 17),
                      textAlign: TextAlign.start,
                    ),
                    const Gap(8),
                    const ReactiveField(
                      controllerName: 'email',
                      hint: 'Email',
                      type: ReactiveFields.TEXT,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Submit Button
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return NormalButton(
                      onPressed: () {
                        context.push(AppRouter.resetPassword);

                        if (form.valid) {
                          // _onSubmit(context, form);
                        } else {
                          form.markAllAsTouched();
                        }
                      },
                      text: 'Next',
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSubmit(BuildContext context, FormGroup form) {
    if (form.valid) {
      final email = form.control('email').value as String;
      // Implement password reset logic here
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link has been sent to your email'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
