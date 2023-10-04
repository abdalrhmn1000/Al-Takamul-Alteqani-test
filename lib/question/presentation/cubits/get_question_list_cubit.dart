
import 'package:al_takamul_alteqani_test/core/domain/use_cases/base_pagination_use_case_params.dart';
import 'package:al_takamul_alteqani_test/core/presentation/cubits/base_states/base_paginated_list_state.dart';
import 'package:al_takamul_alteqani_test/core/presentation/cubits/cubits/pagination_cubit/pagination_cubit.dart';
import 'package:al_takamul_alteqani_test/core/presentation/cubits/cubits/pagination_cubit/pagination_cubit_params.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:al_takamul_alteqani_test/question/domain/usecases/get_question_list_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionListCubit extends PaginationCubit<Question, PaginationParams> {
  final GetQuestionListUseCase useCase;

  late BasePaginationUseCaseParams useCaseParams =
      BasePaginationUseCaseParams();
  bool hasMore = true;

  GetQuestionListCubit(
    this.useCase,
  ) : super(const BasePaginatedListState());

  @override
  void get({PaginationParams? params}) async {
    emit(state.setInProgressState());
    final result = await useCase.call(useCaseParams);
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (result) {
        hasMore = result.hasMore;
        emit(state.setSuccessState(result.data));
      },
    );
  }

  @override
  void paginate() async {
    if (hasMore && !state.isPaginateInProgress) {
      emit(state.copyWith(status: PaginatedListStatus.paginateInProgress));
      useCaseParams.page = useCaseParams.page + 1;
      final result = await useCase.call(useCaseParams);
      result.fold(
        (l) => emit(state.copyWith(
          status: PaginatedListStatus.paginateFailure,
          failure: l,
        )),
        (r) {
          hasMore = r.hasMore;
          final items = state.items..addAll(r.data);
          emit(state.copyWith(
            status: PaginatedListStatus.success,
            items: items,
            hasReachedMax: !hasMore,
          ));
        },
      );
    }
  }
}
