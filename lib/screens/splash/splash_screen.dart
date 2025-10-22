import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/text_theme.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/ui_color.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // Wait for 3 seconds
    if (!mounted) return;
    context.go(AppRouter.language);
    // Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              UIColor.kPrimaryLight,
              UIColor.kPrimaryDark,
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                Assets.images.logo.path,
                width: 270,
                height: 290,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 42.0),
                child: TextUtils(
                  'Welcome to My Dr.House App',
                  style: context.semiBold18!.copyWith(color: UIColor.kWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
