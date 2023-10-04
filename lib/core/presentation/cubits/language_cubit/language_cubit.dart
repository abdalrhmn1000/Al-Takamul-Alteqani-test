import 'package:al_takamul_alteqani_test/core/domain/use_cases/get_language_use_case.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/set_language_use_case.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'language_state.dart';
@lazySingleton
class LanguageCubit extends Cubit<LanguageState> {
  final GetLanguageUseCase getLanguageUseCase;
  final SetLanguageUseCase setLanguageUseCase;

  String? lang;
  LanguageCubit(
    this.getLanguageUseCase,
    this.setLanguageUseCase,
  ) : super(LanguageInitial());

  void setLanguage(String language) {
    setLanguageUseCase.call(language);
    // LocalStorageService().language = language;
    lang = language;
    emit(SetLanguage(lang: language));
  }

  void getLanguage() async {
    var result = await getLanguageUseCase.call(const NoParams());
    result.fold((l) => null, (r) {
      lang = r;
      emit(GetLanguage(lang: r));
    });
  }
}
