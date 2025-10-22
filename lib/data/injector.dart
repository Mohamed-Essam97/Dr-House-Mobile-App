import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_doctor_house_mobile_app/blocs/cubits.dart';
import 'package:my_doctor_house_mobile_app/data/utils/constants.dart';

import 'injector.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  locator.init();
  setupCubitsLocator();
}

@module
abstract class RegisterModule {
  @Singleton()
  Dio get dio {
    var dio = Dio();
    dio.options.baseUrl = kBaseUrl;
    return dio;
  }
}
