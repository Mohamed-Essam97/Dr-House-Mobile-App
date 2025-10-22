import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_doctor_house_mobile_app/blocs/auth/auth_cubit.dart';
import 'package:my_doctor_house_mobile_app/domain/models/blog_model.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/forget_password_screen/forget_password_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/login_screen/login_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/reset_password_screen/reset_password_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/auth/sign_up_screen/signup_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/complete_profile_screen/patient_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/language_selection_screen/language_selection_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/about_us_screen/about_us_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/appointments_screen/add_appointment_screen/add_appointment_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/blog_screen/blog_details_screen/blog_details_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/blog_screen/blog_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/doctors_screen/doctors_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/faqs_screen/faqs_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/health_concerns_screen/health_concerns_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/main_home_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/more_screen/change_language_screen/change_language_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/more_screen/change_password_screen/change_password_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/more_screen/settings_screen/settings_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/notifications_screen/notifications_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/scan_qr_screen/scan_qr_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/main_home_screen/terms_screen/terms_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:my_doctor_house_mobile_app/screens/splash/splash_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
// GoRouter configuration

  static const String splash = '/';
  static const String home = '/home';
  static const String language = '/language';
  static const String onBoarding = '/onBoarding';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String mainHome = '/mainHome';
  static const String notificationsScreen = '/notificationsScreen';
  static const String doctorsScreen = '/doctorsScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String patientQuestionsScreen = '/patientQuestionsScreen';
  static const String healthConcernsScreen = '/healthConcernsScreen';
  static const String faqsScreen = '/faqsScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String termsOfUseScreen = '/termsOfUseScreen';
  static const String blogsScreen = '/blogsScreen';
  static const String blogDetailsScreen = '/blogDetailsScreen';
  static const String scanQR = '/scanQR';
  static const String changePassword = '/changePassword';
  static const String changeLanguage = '/changeLanguageScreen';
  static const String addAppointmentScreen = '/addAppointmentScreen';

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    // errorBuilder: (context, state) => ErrorPage(error: state.error!),
    routes: [
      GoRoute(
        name: 'splash',
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        name: 'language',
        path: language,
        builder: (context, state) => const LanguageSelectionScreen(),
      ),

      GoRoute(
        name: 'onBoarding',
        path: onBoarding,
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(
        name: 'loginScreen',
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        name: 'signUpScreen',
        path: signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        name: 'forgetPassword',
        path: forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),

      GoRoute(
        name: 'resetPassword',
        path: resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),

      GoRoute(
        name: 'mainHome',
        path: mainHome,
        builder: (context, state) => MainHomePage(),
      ),

      GoRoute(
        name: 'notificationsScreen',
        path: notificationsScreen,
        builder: (context, state) => const NotificationsScreen(),
      ),

      GoRoute(
        name: 'doctorsScreen',
        path: doctorsScreen,
        builder: (context, state) => const DoctorsScreen(),
      ),

      GoRoute(
        name: 'settingsScreen',
        path: settingsScreen,
        builder: (context, state) => const SettingsScreen(),
      ),

      GoRoute(
        name: 'patientQuestionsScreen',
        path: patientQuestionsScreen,
        builder: (context, state) => const PatientQuestionsScreen(),
      ),

      GoRoute(
        name: 'healthConcernsScreen',
        path: healthConcernsScreen,
        builder: (context, state) => const HealthConcernsScreen(),
      ),

      GoRoute(
        name: 'faqsScreen',
        path: faqsScreen,
        builder: (context, state) => const FAQScreen(),
      ),
      GoRoute(
        name: 'aboutUsScreen',
        path: aboutUsScreen,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        name: 'termsOfUseScreen',
        path: termsOfUseScreen,
        builder: (context, state) => const TermsScreen(),
      ),

      GoRoute(
        name: 'blogsScreen',
        path: blogsScreen,
        builder: (context, state) => const BlogsScreen(),
      ),

      GoRoute(
        name: 'blogDetailsScreen',
        path: blogDetailsScreen,
        builder: (context, state) {
          final blog = state.extra as Blog;
          return BlogDetailsScreen(blog: blog);
        },
      ),

      GoRoute(
        name: 'scanQR',
        path: scanQR,
        builder: (context, state) => const QRScannerScreen(),
      ),
      GoRoute(
        name: 'changePassword',
        path: changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        name: 'changeLanguage',
        path: changeLanguage,
        builder: (context, state) => const ChangeLanguageScreen(),
      ),
      GoRoute(
        name: 'addAppointmentScreen',
        path: addAppointmentScreen,
        builder: (context, state) => const AddAppointmentScreen(),
      ),
      //   path: '/serviceRequestScreenDetails',
      //   builder: (context, state) {
      //     final request = state.extra as FacilityRequestModel;
      //     return FacilityRequestDetailsScreen(request: request);
      //   },
      // ),
    ],
    // redirect: _guard,
  );

  static String? _guard(BuildContext context, GoRouterState state) {
    final authState = context.read<AuthCubit>().state;
    final bool isLoggedIn = authState.isLoggedIn;

    // List of paths that don't require authentication
    // final publicPaths = [
    //   '/',
    //   '/welcome',
    //   '/login',
    //   '/signup',
    //   '/forgetPasswordScreen',
    //   '/sendEmailOtpScreen',
    //   '/verifyEmailOtpScreen',
    //   '/createPasswordScreen',
    //   '/successForgetPasswordScreen',
    // ];

    // // Allow access to public paths regardless of auth status
    // if (publicPaths.contains(state.matchedLocation)) {
    //   // If user is logged in and trying to access auth screens, redirect to home
    //   if (isLoggedIn) {
    //     return '/';
    //   }
    //   return null;
    // }

    // For all other paths, redirect to login if not authenticated
    if (!isLoggedIn) {
      return '/';
    }

    return null;
  }
}
