// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_doctor_house_mobile_app/data/datasources/remote/auth_api_service.dart'
    as _i567;
import 'package:my_doctor_house_mobile_app/data/injector.dart' as _i103;
import 'package:my_doctor_house_mobile_app/data/repositories/auth_repository.dart'
    as _i425;
import 'package:my_doctor_house_mobile_app/data/repositories/auth_repository_impl.dart'
    as _i669;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i567.AuthApiService>(
        () => _i567.AuthApiService(gh<_i361.Dio>()));
    gh.singleton<_i425.AuthRepository>(
        () => _i669.AuthRepositoryImpl(gh<_i567.AuthApiService>()));
    return this;
  }
}

class _$RegisterModule extends _i103.RegisterModule {}
