import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/buttons/custom_normal_button.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/custom_forms/reactive_widgets.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/login_screen/widgets/socail_login_buttons.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = useMemoized(
      () => FormGroup({
        'email': FormControl<String>(
            // validators: [Validators.required, Validators.email],
            ),
        'password': FormControl<String>(
            // validators: [Validators.required, Validators.minLength(6)],
            ),
      }),
      const [], // Empty dependency array
    );

    final rememberMe = useState(false);

    return Scaffold(
      backgroundColor: UIColor.kAuthBackGround,
      appBar: const CustomAppBar(
        leading: SizedBox(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // // Logo
              Image.asset(
                Assets.images.filledLogo.path,
                height: 86,
                width: 180,
              ),
              // const SizedBox(height: 32),
              const Gap(45),
              // Title and Description
              TextUtils(
                'Sign in',
                style: context.bold32,
              ),
              const Gap(12),
              TextUtils(
                'Please enter your email and password to sign in.',
                style: context.medium(size: 12, color: UIColor.kTextDarkGrey)!,
                shouldTrim: false,
              ),
              // const SizedBox(height: 32),
              const Gap(24),
              // Email Field
              const ReactiveField(
                type: ReactiveFields.TEXT,
                controllerName: 'email',
                hint: 'Email',
              ),

              // Password Field
              const ReactiveField(
                controllerName: 'password',
                secure: true,
                type: ReactiveFields.PASSWORD,
                hint: 'Password',
              ),

              const Gap(12),
              // // Remember Me and Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe.value,
                        onChanged: (value) {
                          rememberMe.value = value ?? false;
                        },
                        fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // visualDensity: VisualDensity.compact,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                      ),
                      const Gap(4),
                      TextUtils(
                        'Remember me',
                        style: context.medium(
                          size: 12,
                          color: UIColor.kTextDarkGrey,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password
                      context.push(AppRouter.forgetPassword);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: TextUtils(
                      'Forgot Password ?',
                      style: context.semiBold15!
                          .copyWith(color: UIColor.kPrimaryLight, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const Gap(14),
              // Login Button
              NormalButton(
                onPressed: () {
                  // Handle login
                  context.push(AppRouter.mainHome);
                },
                text: 'Log in',
              ),

              const SocialLoginButtonsWidget(),
              const Gap(50),
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                    "Don’t have an account?",
                    style: context.medium(
                      size: 13,
                      color: UIColor.kTextDarkGrey,
                    ),
                  ),
                  const Gap(6),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      // Navigate to sign up screen
                      context.push(AppRouter.signUpScreen);
                    },
                    child: TextUtils(
                      'Sign Up',
                      style: context.semiBold(
                          size: 13, color: UIColor.kPrimaryLight),
                    ),
                  ),
                ],
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
