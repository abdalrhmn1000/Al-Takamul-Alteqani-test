part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class SetTheme extends ThemeState {
  final ThemeMode mode;

  SetTheme({
    required this.mode,
  });
}

class GetThemeMode extends ThemeState {
  final ThemeMode? themeMode;

  GetThemeMode({
    this.themeMode,
  });
}
