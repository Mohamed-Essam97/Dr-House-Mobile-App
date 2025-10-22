import 'package:dio/dio.dart';
import 'package:my_doctor_house_mobile_app/blocs/auth/auth_cubit.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/settings_cubit.dart';
import 'package:my_doctor_house_mobile_app/data/injector.dart';

class AuthInterceptor extends Interceptor {
  final auth = locator<AuthCubit>();
  final settings = locator<SettingsCubit>();

  AuthInterceptor();

  bool get isTokenExpired {
    String expiresOn = auth.state.expiresOn;
    if (expiresOn.isEmpty) return false;

    DateTime now = DateTime.now();
    return now.millisecondsSinceEpoch / 1000 > int.parse(expiresOn);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';

    final isLoggedIn = auth.state.isLoggedIn;
    final accessToken = auth.state.accessToken;
    final refreshToken = auth.state.refreshToken;
    final token = isTokenExpired ? refreshToken : accessToken;
    options.headers['Platform'] = "mobile";

    if (isLoggedIn && token.isNotEmpty) {
      options.headers['Authorization'] = token;
    }

    options.headers['Accept-Language'] = settings.state.locale;

    super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (isTokenExpired) {
      final accessToken = response.headers['x-access-token']!.first;
      final refreshToken = response.headers['x-refresh-token']!.first;
      final expiresOn = response.headers['x-expires-on']!.first;

      // auth.updateToken(accessToken, refreshToken, expiresOn);
    }

    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && auth.state.isLoggedIn) {
      // await auth.logout();
    }

    super.onError(err, handler);
  }
}
