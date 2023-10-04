part of 'language_cubit.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class SetLanguage extends LanguageState {
  final String lang;

  SetLanguage({
    required this.lang,
  });
}

class GetLanguage extends LanguageState {
  final String? lang;

  GetLanguage({
    this.lang,
  });
}
