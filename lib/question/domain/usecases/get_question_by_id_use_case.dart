
import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/use_case.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:al_takamul_alteqani_test/question/domain/repositories/question_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class GetQuestionByIdUseCase extends UseCase<Question, int> {
  final QuestionRepository repository;

  GetQuestionByIdUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Question>> call(int params) {
    return repository.getQuestionById(id: params);
  }
}
