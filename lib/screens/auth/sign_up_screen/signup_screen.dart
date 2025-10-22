import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/theme_colors.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/custom_forms/reactive_widgets.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/login_screen/widgets/socail_login_buttons.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/sign_up_screen/widgets/select_country_code_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
// Import other necessary files

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = useMemoized<FormGroup>(
        () => fb.group({
              'email': [
                '',
                // Validators.compose([Validators.required, Validators.email])
              ],
              'mobile': [
                '',
                // Validators.compose([Validators.required])
              ],
              'password': [
                '',
                // Validators.compose(
                // [Validators.required, Validators.minLength(6)])
              ],
              'confirmPassword': [
                '',
                // Validators.compose([Validators.required])
              ],
              'agreeTerms': [false, Validators.requiredTrue],
            }, [
              // Validators.mustMatch('password', 'confirmPassword')
            ]),
        const []); // Empty dependency array since form structure never changes

    TextEditingController phoneController = TextEditingController();
    final terms = useState(false); // Add this line

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: UIColor.kAuthBackGround,
      body: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          constraints.maxHeight - 14, // account for padding
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Main content column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Gap(4),
                            // Title
                            TextUtils(
                              'Register',
                              style: context.bold(size: 32),
                            ),
                            const Gap(8),
                            TextUtils(
                              'Create an account to continue!',
                              style: context.medium(
                                  size: 12, color: UIColor.kTextDarkGrey),
                              shouldTrim: false,
                            ),
                            const Gap(12),
                            // Email Field
                            const ReactiveField(
                              controllerName: 'email',
                              hint: 'Email',
                              type: ReactiveFields.TEXT,
                              textInputAction: TextInputAction.next,
                            ),
                            const Gap(4),
                            // Mobile Field with Country Selector
                            SelectCountryCodeWidget(
                              controller: phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter phone number';
                                }
                                return null;
                              },
                            ),
                            const Gap(4),
                            // Password Field
                            const ReactiveField(
                              controllerName: 'password',
                              hint: 'Password',
                              type: ReactiveFields.PASSWORD,
                              textInputAction: TextInputAction.next,
                            ),
                            // Confirm Password Field
                            const ReactiveField(
                              controllerName: 'confirmPassword',
                              hint: 'Confirm Password',
                              type: ReactiveFields.PASSWORD,
                              textInputAction: TextInputAction.done,
                            ),
                            const Gap(12),

                            // Terms and Conditions Checkbox
                            Row(
                              children: [
                                Checkbox(
                                  value: terms.value,
                                  onChanged: (value) {
                                    terms.value = value ?? false;
                                  },
                                  fillColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states
                                          .contains(WidgetState.selected)) {
                                        return UIColor.kTextDarkGrey;
                                      }
                                      return Colors.transparent;
                                    },
                                  ),
                                  side: const BorderSide(
                                    width: 2,
                                    color: UIColor.kDarkGrey,
                                  ),
                                  checkColor: Colors.white,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  // visualDensity: VisualDensity.compact,
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -4),
                                ),
                                const Gap(4),
                                RichText(
                                  text: TextSpan(
                                    text: 'I agree to the ',
                                    style: context.medium()?.copyWith(
                                        color: UIColor.kTextDarkGrey,
                                        fontSize: 12),
                                    children: [
                                      TextSpan(
                                        text: 'Terms of Use.',
                                        style: context.bold(
                                          color: context.primary,
                                          size: 12,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.push(
                                                AppRouter.termsOfUseScreen);
                                            // Navigate to Terms & Conditions
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const Gap(14),
                            // Register Button
                            ReactiveFormConsumer(
                              builder: (context, form, child) {
                                return NormalButton(
                                  onPressed: () {
                                    // form.markAllAsTouched();
                                    context
                                        .push(AppRouter.patientQuestionsScreen);

                                    if (form.valid) {
                                      _onRegister(context, form);
                                    }
                                  },
                                  text: 'Register',
                                );
                              },
                            ),
                            const SocialLoginButtonsWidget(),
                          ],
                        ),
                        // Bottom row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                              "Already have an account?",
                              style: context.medium(
                                  color: UIColor.kTextDarkGrey, size: 13),
                            ),
                            const Gap(6),
                            TextButton(
                              onPressed: () {
                                context.pop(AppRouter.loginScreen);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: TextUtils(
                                'Log in',
                                style: context.semiBold(
                                    color: UIColor.kPrimaryLight, size: 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _onRegister(BuildContext context, FormGroup form) {
    if (form.valid) {
      // Implement registration logic
    }
  }

  void _onGoogleSignIn(BuildContext context) {
    // Implement Google sign-in
  }

  void _onAppleSignIn(BuildContext context) {
    // Implement Apple sign-in
  }
}
