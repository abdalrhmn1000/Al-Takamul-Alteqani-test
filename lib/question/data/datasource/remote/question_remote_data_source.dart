import 'package:al_takamul_alteqani_test/core/data/models/base_pagination_params_model/base_pagination_params_model.dart';
import 'package:al_takamul_alteqani_test/core/data/models/base_response/base_response.dart';
import 'package:al_takamul_alteqani_test/core/data/utils/configuration.dart';
import 'package:al_takamul_alteqani_test/question/data/models/question_model/question_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'question_remote_data_source.g.dart';

abstract class QuestionRemoteDataSource {
  Future<BaseResponse<List<QuestionModel>>> getQuestionList({
    required BasePaginationParamsModel params,
  });

  Future<BaseResponse<List<QuestionModel>>> getQuestionById({
    required int id,
  });
}

@LazySingleton(as: QuestionRemoteDataSource)
@RestApi(baseUrl: '')
abstract class QuestionRemoteDataSourceImpl
    implements QuestionRemoteDataSource {
  @factoryMethod
  factory QuestionRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _QuestionRemoteDataSourceImpl(dio, baseUrl: configuration.getAppUrl);
  }

  @override
  @GET('/questions?order=desc&sort=activity&site=stackoverflow')
  Future<BaseResponse<List<QuestionModel>>> getQuestionList({
    @Queries() required BasePaginationParamsModel params,
  });

  @override
  @GET('/questions/{id}?order=desc&sort=activity&site=stackoverflow')
  Future<BaseResponse<List<QuestionModel>>> getQuestionById({
    @Path('id') required int id,
  });
}
