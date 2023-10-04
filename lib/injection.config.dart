// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:al_takamul_alteqani_test/core/data/datasource/local/core_local_datasource.dart'
    as _i11;
import 'package:al_takamul_alteqani_test/core/data/repositories/core_repository_impl.dart'
    as _i13;
import 'package:al_takamul_alteqani_test/core/data/utils/configuration.dart'
    as _i3;
import 'package:al_takamul_alteqani_test/core/domain/repositories/core_repository.dart'
    as _i12;
import 'package:al_takamul_alteqani_test/core/domain/use_cases/get_language_use_case.dart'
    as _i14;
import 'package:al_takamul_alteqani_test/core/domain/use_cases/get_theme_mode_use_case.dart'
    as _i17;
import 'package:al_takamul_alteqani_test/core/domain/use_cases/set_language_use_case.dart'
    as _i18;
import 'package:al_takamul_alteqani_test/core/domain/use_cases/set_theme_mode_use_case.dart'
    as _i19;
import 'package:al_takamul_alteqani_test/core/presentation/cubits/language_cubit/language_cubit.dart'
    as _i23;
import 'package:al_takamul_alteqani_test/core/presentation/cubits/theme_cubit/theme_cubit.dart'
    as _i20;
import 'package:al_takamul_alteqani_test/core/presentation/utils/configuration.dart'
    as _i4;
import 'package:al_takamul_alteqani_test/injectable_module.dart' as _i24;
import 'package:al_takamul_alteqani_test/question/data/datasource/remote/question_remote_data_source.dart'
    as _i7;
import 'package:al_takamul_alteqani_test/question/data/repositories/question_repository_impl.dart'
    as _i9;
import 'package:al_takamul_alteqani_test/question/domain/repositories/question_repository.dart'
    as _i8;
import 'package:al_takamul_alteqani_test/question/domain/usecases/get_question_by_id_use_case.dart'
    as _i15;
import 'package:al_takamul_alteqani_test/question/domain/usecases/get_question_list_use_case.dart'
    as _i16;
import 'package:al_takamul_alteqani_test/question/presentation/cubits/get_question_by_id_cubit.dart'
    as _i21;
import 'package:al_takamul_alteqani_test/question/presentation/cubits/get_question_list_cubit.dart'
    as _i22;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.Configuration>(
      () => _i4.DevConfiguration(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i3.Configuration>(
      () => _i4.StagingConfiguration(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i3.Configuration>(
      () => _i4.ProdConfiguration(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i5.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
    gh.lazySingleton<_i7.QuestionRemoteDataSource>(
        () => _i7.QuestionRemoteDataSourceImpl(
              gh<_i5.Dio>(),
              gh<_i3.Configuration>(),
            ));
    gh.lazySingleton<_i8.QuestionRepository>(() => _i9.QuestionRepositoryImpl(
          gh<_i6.Logger>(),
          gh<_i7.QuestionRemoteDataSource>(),
        ));
    await gh.lazySingletonAsync<_i10.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i11.CoreLocalDatasource>(
        () => _i11.AuthLocalDatasourceImpl(gh<_i10.SharedPreferences>()));
    gh.lazySingleton<_i12.CoreRepository>(
        () => _i13.CoreRepositoryImpl(gh<_i11.CoreLocalDatasource>()));
    gh.lazySingleton<_i14.GetLanguageUseCase>(
        () => _i14.GetLanguageUseCase(repository: gh<_i12.CoreRepository>()));
    gh.lazySingleton<_i15.GetQuestionByIdUseCase>(() =>
        _i15.GetQuestionByIdUseCase(repository: gh<_i8.QuestionRepository>()));
    gh.factory<_i16.GetQuestionListUseCase>(
        () => _i16.GetQuestionListUseCase(gh<_i8.QuestionRepository>()));
    gh.lazySingleton<_i17.GetThemeModeUseCase>(
        () => _i17.GetThemeModeUseCase(repository: gh<_i12.CoreRepository>()));
    gh.lazySingleton<_i18.SetLanguageUseCase>(
        () => _i18.SetLanguageUseCase(repository: gh<_i12.CoreRepository>()));
    gh.lazySingleton<_i19.SetThemeModeUseCase>(
        () => _i19.SetThemeModeUseCase(repository: gh<_i12.CoreRepository>()));
    gh.lazySingleton<_i20.ThemeCubit>(() => _i20.ThemeCubit(
          gh<_i17.GetThemeModeUseCase>(),
          gh<_i19.SetThemeModeUseCase>(),
        ));
    gh.factory<_i21.GetQuestionByIdCubit>(
        () => _i21.GetQuestionByIdCubit(gh<_i15.GetQuestionByIdUseCase>()));
    gh.factory<_i22.GetQuestionListCubit>(
        () => _i22.GetQuestionListCubit(gh<_i16.GetQuestionListUseCase>()));
    gh.lazySingleton<_i23.LanguageCubit>(() => _i23.LanguageCubit(
          gh<_i14.GetLanguageUseCase>(),
          gh<_i18.SetLanguageUseCase>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i24.InjectableModule {}
