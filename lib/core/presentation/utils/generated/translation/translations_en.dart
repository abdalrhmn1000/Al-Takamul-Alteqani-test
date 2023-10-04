import 'package:intl/intl.dart' as intl;

import 'translations.dart';

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get success => 'Success';

  @override
  String get retry => 'Retry';

  @override
  String get errorMessage => 'OOPS! Something went wrong';

  @override
  String get noInternetConnectionMessage => 'No internet connection';

  @override
  String get accessDeniedMessage => 'Access Denied, You have insufficient privileges';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get unauthenticatedMessage => 'Session is Expired!';

  @override
  String get noData => 'No Data';

  @override
  String get questions => 'Questions';

  @override
  String get answers => 'Answers';

  @override
  String get score => 'Score';

  @override
  String get questionDetails => 'Question Details';

  @override
  String get question => 'Question';

  @override
  String get tags => 'Tags';

  @override
  String get creationDate => 'Creation Date';

  @override
  String get contentLicense => 'Content License';

  @override
  String get linkQuestion => 'Link Question';

  @override
  String get settings => 'Settings';

  @override
  String get callApiFromPlugin => 'Call Api From Plugin';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String themeEnum(String theme) {
    String _temp0 = intl.Intl.selectLogic(
      theme,
      {
        'system': 'System Preference',
        'light': 'Light',
        'dark': 'Dark',
        'other': 'None',
      },
    );
    return '$_temp0';
  }

  @override
  String languageEnum(String theme) {
    String _temp0 = intl.Intl.selectLogic(
      theme,
      {
        'english': 'English',
        'arabic': 'العربية',
        'other': 'None',
      },
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get done => 'Done';
}
