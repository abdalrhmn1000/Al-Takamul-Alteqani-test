import 'package:al_takamul_alteqani_test/core/presentation/cubits/base_states/base_state.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:al_takamul_alteqani_test/question/domain/usecases/get_question_by_id_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionByIdCubit extends Cubit<BaseState<Question>> {
  final GetQuestionByIdUseCase useCase;

  GetQuestionByIdCubit(
    this.useCase,
  ) : super(const BaseState());

  void get(int id) async {
    emit(state.setInProgressState());

    final result = await useCase.call(id);
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (deviceGroup) => emit(state.setSuccessState(deviceGroup)),
    );
  }
}
