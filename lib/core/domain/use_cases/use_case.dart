import 'package:dartz/dartz.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
