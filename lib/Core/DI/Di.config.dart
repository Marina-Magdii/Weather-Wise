// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Features/Home/data/data_sources/Dao.dart' as _i383;
import '../../Features/Home/data/data_sources/DaoImpl/ApiImpl.dart' as _i29;
import '../../Features/Home/data/repositories/RepoImpl.dart' as _i95;
import '../../Features/Home/domain/repositories/Repo.dart' as _i319;
import '../../Features/Home/domain/use_cases/Usecase.dart' as _i1066;
import '../../Features/Home/presentation/manager/weather_cubit.dart' as _i261;
import '../ApiManager.dart' as _i537;

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
    gh.singleton<_i537.ApiManager>(() => _i537.ApiManager());
    gh.factory<_i383.Dao>(() => _i29.ApiImpl(gh<_i537.ApiManager>()));
    gh.factory<_i319.Repo>(() => _i95.RepoImpl(gh<_i383.Dao>()));
    gh.factory<_i1066.Usecase>(() => _i1066.Usecase(gh<_i319.Repo>()));
    gh.factory<_i261.WeatherCubit>(
        () => _i261.WeatherCubit(gh<_i1066.Usecase>()));
    return this;
  }
}
