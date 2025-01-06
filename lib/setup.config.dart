// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/main_api.dart' as _i767;
import 'features/home_page/data/repositories/tk_info_repository_impl.dart'
    as _i304;
import 'features/home_page/data/repositories/workers_repo_impl.dart' as _i965;
import 'features/home_page/data/sourse/tk_info_sourse.dart' as _i136;
import 'features/home_page/data/sourse/tk_info_sourse_impl.dart' as _i609;
import 'features/home_page/data/sourse/workers_sourse.dart' as _i1034;
import 'features/home_page/data/sourse/workers_sourse_impl.dart' as _i487;
import 'features/home_page/domain/repositories/tk_info_repository.dart'
    as _i180;
import 'features/home_page/domain/repositories/workers_repository.dart'
    as _i705;
import 'features/home_page/domain/usecases/add_new_worker.dart' as _i998;
import 'features/home_page/domain/usecases/delete_worker.dart' as _i495;
import 'features/home_page/domain/usecases/get_all_workers.dart' as _i27;
import 'features/home_page/domain/usecases/get_periods.dart' as _i672;
import 'features/home_page/domain/usecases/get_tk_info.dart' as _i301;
import 'features/home_page/domain/usecases/get_works_by_period.dart' as _i885;
import 'features/home_page/presentation/cubits/cubit/cubit.dart' as _i531;
import 'features/home_page/presentation/cubits/drop_down_button_cubit/drop_down_button_cubit.dart'
    as _i487;
import 'features/home_page/presentation/cubits/foreman_page/workers_cubit.dart'
    as _i218;
import 'features/home_page/presentation/cubits/tk_info_cubit/tk_info_cubit.dart'
    as _i912;

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
    gh.lazySingleton<_i767.MainApi>(() => _i767.MainApi());
    gh.lazySingleton<_i487.DropDownButtonCubit>(
        () => _i487.DropDownButtonCubit());
    gh.lazySingleton<_i1034.WorkersSourse>(
        () => _i487.WorkersSourseImpl(gh<_i767.MainApi>()));
    gh.lazySingleton<_i136.TkInfoSourse>(
        () => _i609.TkInfoSourseImpl(gh<_i767.MainApi>()));
    gh.lazySingleton<_i180.TkInfoRepository>(
        () => _i304.TkInfoRepositoryImpl(gh<_i136.TkInfoSourse>()));
    gh.lazySingleton<_i672.GetPeriods>(
        () => _i672.GetPeriods(tkInfoRepository: gh<_i180.TkInfoRepository>()));
    gh.lazySingleton<_i301.GetTkInfo>(
        () => _i301.GetTkInfo(tkInfoRepository: gh<_i180.TkInfoRepository>()));
    gh.lazySingleton<_i885.GetWorkByPeriod>(() =>
        _i885.GetWorkByPeriod(tkInfoRepository: gh<_i180.TkInfoRepository>()));
    gh.lazySingleton<_i705.WorkersRepository>(
        () => _i965.WorkersRepoImpl(gh<_i1034.WorkersSourse>()));
    gh.lazySingleton<_i998.AddNewWorker>(() =>
        _i998.AddNewWorker(workersRepository: gh<_i705.WorkersRepository>()));
    gh.lazySingleton<_i495.DeleteWorker>(() =>
        _i495.DeleteWorker(workersRepository: gh<_i705.WorkersRepository>()));
    gh.lazySingleton<_i27.GetAllWorkers>(() =>
        _i27.GetAllWorkers(workersRepository: gh<_i705.WorkersRepository>()));
    gh.lazySingleton<_i912.TKInfoCubit>(() => _i912.TKInfoCubit(
          gh<_i487.DropDownButtonCubit>(),
          gh<_i885.GetWorkByPeriod>(),
          gh<_i672.GetPeriods>(),
          gh<_i301.GetTkInfo>(),
        ));
    gh.lazySingleton<_i218.WorkersCubit>(() => _i218.WorkersCubit(
          getAllWorkers: gh<_i27.GetAllWorkers>(),
          addNewWorker: gh<_i998.AddNewWorker>(),
          deleteWorker: gh<_i495.DeleteWorker>(),
        ));
    return this;
  }
}
