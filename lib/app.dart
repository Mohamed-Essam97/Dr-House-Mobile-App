import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_doctor_house_mobile_app/data/injector.dart';
import 'package:my_doctor_house_mobile_app/data/interceptors/auth_interceptor.dart';
import 'package:my_doctor_house_mobile_app/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final talker = useState<Talker>(Talker());
    final dio = locator<Dio>();
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(AuthInterceptor());

    final init = useCallback(() async {
      // initialize hydrated bloc
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory(),
      );
    }, []);

    useEffect(
      () {
        init();
        final talker = TalkerFlutter.init(
          settings: TalkerSettings(
            colors: {
              TalkerLogType.verbose: AnsiPen()..yellow(),
            },
          ),
        );
        talker.verbose('Talker initialization completed');
        locator.registerSingleton<Talker>(talker);

        final talkerDioLogger = TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: false,
            printRequestData: true,
            printResponseData: true,
            printErrorData: true,
            printErrorHeaders: false,
            printErrorMessage: false,
            printResponseMessage: true,
          ),
        );

        dio.interceptors.add(talkerDioLogger);
        talker.info('Repositories initialization completed');

        return null;
      },
      [],
    );

    Bloc.observer = TalkerBlocObserver(
      talker: talker.value,
      settings: const TalkerBlocLoggerSettings(
        printCreations: false,
        printClosings: false,
        printStateFullData: true,
      ),
    );

    return TalkerWrapper(
      talker: talker.value,
      options: const TalkerWrapperOptions(
        enableErrorAlerts: false,
        enableExceptionAlerts: false,
      ),
      child: const MyApp(),
    );
  }
}
