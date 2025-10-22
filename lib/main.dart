import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_doctor_house_mobile_app/app.dart';
import 'package:my_doctor_house_mobile_app/app_router.dart';
import 'package:my_doctor_house_mobile_app/blocs/cubits.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/bloc/language_bloc.dart';
import 'package:my_doctor_house_mobile_app/data/injector.dart';
import 'package:my_doctor_house_mobile_app/presentation/themes/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBloc.storage = storage;

  configureDependencies();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const App(), // Wrap your app
  // ));

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Keep splash screen until initialization is complete
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const App());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    useEffect(() {
      // NotificationService().init();
      // firebaseMessaging.requestPermission();

      return null;
    }, []);

    // Remove splash screen when app is ready
    FlutterNativeSplash.remove();

    return MultiBlocProvider(
      providers: [...providers],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, langState) {
              return MaterialApp.router(
                // routeInformationParser:
                //     AppRouter.router.routeInformationParser,
                // routerDelegate: AppRouter.router.routerDelegate,
                locale: Locale(langState.locale ?? 'en'),
                localizationsDelegates: const [
                  // Assuming AppLocalizations.delegate is not defined, removing it
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'), // Example supported locale
                  Locale('ar', 'EG'), // Example supported locale
                ],
                debugShowCheckedModeBanner: false,
                title: 'My Dr.House', // Assuming 'App Title' as a placeholder
                themeMode: ThemeMode.dark,
                theme: AppTheme.lightThemeData,
                darkTheme: AppTheme.lightThemeData,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
