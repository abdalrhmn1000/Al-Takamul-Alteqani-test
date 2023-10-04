import 'package:al_takamul_alteqani_test/core/data/models/base_pagination_params_model/base_pagination_params_model.dart';
import 'package:al_takamul_alteqani_test/core/data/repositories/base_repository_impl.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/paginated_list.dart';
import 'package:al_takamul_alteqani_test/question/data/datasource/remote/question_remote_data_source.dart';
import 'package:al_takamul_alteqani_test/question/data/models/question_model/question_model.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:al_takamul_alteqani_test/question/domain/repositories/question_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuestionRepository)
class QuestionRepositoryImpl extends BaseRepositoryImpl
    implements QuestionRepository {
  final QuestionRemoteDataSource remote;

  QuestionRepositoryImpl(
    super._logger,
    this.remote,
  );

  @override
  Future<Either<Failure, PaginatedList<Question>>> getQuestionList({
    int? pageSize,
    int? page,
  }) {
    return request(() async {
      final result = await remote.getQuestionList(
          params: BasePaginationParamsModel(
        page: page,
        pageSize: pageSize,
      ));

      return Right(PaginatedList(
        result.hasMore!,
        result.items!.map((e) => e.toDomain()).toList(),
      ));
    });
  }

  @override
  Future<Either<Failure, Question>> getQuestionById({
    required int id,
  }) {
    return request(
      () async {
        final result = await remote.getQuestionById(id: id);
        return right(result.items!.first.toDomain());
      },
    );
  }
}
