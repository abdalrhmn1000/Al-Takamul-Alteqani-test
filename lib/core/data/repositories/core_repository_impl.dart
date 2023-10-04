import 'dart:async';

import 'package:al_takamul_alteqani_test/core/data/datasource/local/core_local_datasource.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/domain/repositories/core_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: CoreRepository)
class CoreRepositoryImpl extends CoreRepository {
  final CoreLocalDatasource local;

  CoreRepositoryImpl(
    this.local,
  );

  @override
  Future<Either<Failure, String?>> getThemeMode() async {
    return right(local.getThemeMode());
  }

  @override
  Future<Either<Failure, String?>> getLanguage() async {
    return right(local.getLanguage());
  }

  @override
  Future<Either<Failure, Unit>> setThemeMode({required String themeMode}) async {
    local.setThemeMode(
      themeMode: themeMode,
    );
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> setLanguage({
    required String language,
  }) async {
    local.setLanguage(
      language: language,
    );
    return right(unit);
  }
}
