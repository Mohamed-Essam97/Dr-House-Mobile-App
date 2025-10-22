import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/auth/auth_state.dart';
import 'package:my_doctor_house_mobile_app/data/injector.dart';
import 'package:my_doctor_house_mobile_app/data/repositories/auth_repository.dart';
import 'package:my_doctor_house_mobile_app/domain/params/login.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final AuthRepository _authRepo = locator<AuthRepository>();

  AuthCubit() : super(const AuthState());

  // Authentication methods
  Future<void> login({String? userName, required String password}) async {
    emit(state.copyWith(isLoggingIn: true));

    final deviceToken = state.deviceToken;

    final loginParams = LoginParams(
      email: userName,
      password: password,
      deviceToken: deviceToken,
    );

    final result = await _authRepo.login(loginParams);

    result.fold((failure) {
      emit(state.copyWith(
        isLoggingIn: false,
      ));
    }, (res) async {
      emit(state.copyWith(
        user: res.user,
        accessToken: res.accessToken,
        refreshToken: res.refreshToken,
        expiresOn: res.expiresOn,
        isLoggingIn: false,
        isLoggedIn: true,
      ));
    });
  }

  // Future<void> logout() async {
  //   final query = LogoutParams(deviceToken: state.deviceToken);

  //   await _authRepo.logout(query);

  //   emit(
  //     AuthState(
  //       deviceToken: state.deviceToken,
  //       account: state.account,
  //     ),
  //   );
  // }

  // HydratedBloc methods
  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      return AuthState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
