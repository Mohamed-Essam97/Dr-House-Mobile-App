import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/settings_state.dart';
import 'package:my_doctor_house_mobile_app/data/storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final MyHydratedStorage _storage = MyHydratedStorage();

  SettingsCubit() : super(SettingsState());

  Future init() async {
    PackageInfo info = await PackageInfo.fromPlatform();

    final locale = await _storage.read('locale');
    final theme = await _storage.read('theme');

    emit(
      state.copyWith(
        locale: locale,
        theme: theme,
        appVersion: info.version,
        buildNumber: info.buildNumber,
      ),
    );
  }

  Future changeLocale(String locale) async {
    await _storage.write('locale', locale);
    emit(state.copyWith(locale: locale));
  }

  Future changeTheme(String theme) async {
    await _storage.write('theme', theme);
    emit(state.copyWith(theme: theme));
  }
}
