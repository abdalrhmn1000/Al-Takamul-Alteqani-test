import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/paginated_list.dart';
import 'package:al_takamul_alteqani_test/core/domain/repositories/base_repository.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:dartz/dartz.dart';

abstract class QuestionRepository extends BaseRepository {
  Future<Either<Failure, PaginatedList<Question>>> getQuestionList({
    int? pageSize,
    int? page,
  });

  Future<Either<Failure, Question>> getQuestionById({
    required int id,
  });
}
