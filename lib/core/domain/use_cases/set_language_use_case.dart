import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/use_case.dart';
import 'package:al_takamul_alteqani_test/core/domain/repositories/core_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetLanguageUseCase extends UseCase<Unit, String> {
  final CoreRepository repository;

  SetLanguageUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(params) {
    return repository.setLanguage(language: params);
  }
}
