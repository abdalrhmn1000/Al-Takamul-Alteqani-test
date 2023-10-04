import 'dart:async';
import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CoreRepository {
  Future<Either<Failure, String?>> getThemeMode();

  Future<Either<Failure, Unit>> setThemeMode({
    required String themeMode,
  });

  Future<Either<Failure, String?>> getLanguage();

  Future<Either<Failure, Unit>> setLanguage({
    required String language,
  });
}
