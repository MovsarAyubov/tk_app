// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/home_page/presentation/cubits/cubit/cubit.dart' as _i531;
import 'features/home_page/presentation/cubits/foreman_page/foreman_page_cubit.dart'
    as _i98;

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
    gh.factory<_i531.Cubit>(() => _i531.Cubit());
    gh.factory<_i98.ForemanPageCubit>(() => _i98.ForemanPageCubit());
    return this;
  }
}
