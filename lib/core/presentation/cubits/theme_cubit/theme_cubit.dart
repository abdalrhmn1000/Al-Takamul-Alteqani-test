import 'package:al_takamul_alteqani_test/core/domain/use_cases/get_theme_mode_use_case.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/set_theme_mode_use_case.dart';
import 'package:al_takamul_alteqani_test/core/domain/use_cases/use_case.dart';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  final GetThemeModeUseCase getThemeIsDarkModeUseCase;
  final SetThemeModeUseCase setThemeModeUseCase;
  ThemeMode? themeMode;

  ThemeCubit(
    this.getThemeIsDarkModeUseCase,
    this.setThemeModeUseCase,
  ) : super(ThemeInitial());

  void setTheme(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      setThemeModeUseCase.call(
        ThemeMode.dark.name,
      );
    } else if (mode == ThemeMode.light) {
      setThemeModeUseCase.call(
        ThemeMode.light.name,
      );
    } else {
      setThemeModeUseCase.call(
        ThemeMode.system.name,
      );
    }
    themeMode = mode;
    emit(SetTheme(mode: mode));
  }

  void getThemeMode() async {
    var result = await getThemeIsDarkModeUseCase.call(const NoParams());
    result.fold((l) => null, (r) {
      themeMode =
          ThemeMode.values.firstWhereOrNull((element) => element.name == r);
      emit(GetThemeMode(
        themeMode: themeMode,
      ));
    });
  }
}
