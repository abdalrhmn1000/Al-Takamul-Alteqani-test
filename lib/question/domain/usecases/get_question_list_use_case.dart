import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/paginated_list.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/base_pagination_use_case_params.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/use_case.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:al_takamul_alteqani_test/question/domain/repositories/question_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionListUseCase
    extends UseCase<PaginatedList<Question>, BasePaginationUseCaseParams> {
  final QuestionRepository repository;

  GetQuestionListUseCase(this.repository);

  @override
  Future<Either<Failure, PaginatedList<Question>>> call(
      BasePaginationUseCaseParams params) {
    return repository.getQuestionList(
      pageSize: params.pageSize??10,
      page: params.page??1,
    );
  }
}
