import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/use_case.dart';
import 'package:al_takamul_alteqani_test/core/domain/repositories/core_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLanguageUseCase extends UseCase<String?, NoParams> {
  final CoreRepository repository;

  GetLanguageUseCase({required this.repository});

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return repository.getLanguage();
  }
}
