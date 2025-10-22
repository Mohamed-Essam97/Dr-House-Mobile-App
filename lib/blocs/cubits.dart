import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/auth/auth_cubit.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/bloc/language_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/settings_cubit.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/theme_cubit.dart';
import 'package:my_doctor_house_mobile_app/data/injector.dart';

final _settingsCubit = SettingsCubit();
final _authCubit = AuthCubit();

List providers = [
  BlocProvider(create: (_) => _settingsCubit),
  BlocProvider(create: (_) => LanguageCubit()),
  BlocProvider(create: (_) => ThemeCubit()),
  BlocProvider(create: (_) => _authCubit),
];

void setupCubitsLocator() {
  locator.registerFactory<AuthCubit>(() => _authCubit);
  locator.registerFactory<SettingsCubit>(() => _settingsCubit);
}
