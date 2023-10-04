import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'translations_ar.dart';
import 'translations_en.dart';

/// Callers can lookup localized strings with an instance of Translations
/// returned by `Translations.of(context)`.
///
/// Applications need to include `Translations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translation/translations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Translations.localizationsDelegates,
///   supportedLocales: Translations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Translations.supportedLocales
/// property.
abstract class Translations {
  Translations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static const LocalizationsDelegate<Translations> delegate = _TranslationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'OOPS! Something went wrong'**
  String get errorMessage;

  /// No description provided for @noInternetConnectionMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnectionMessage;

  /// No description provided for @accessDeniedMessage.
  ///
  /// In en, this message translates to:
  /// **'Access Denied, You have insufficient privileges'**
  String get accessDeniedMessage;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// No description provided for @unauthenticatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Session is Expired!'**
  String get unauthenticatedMessage;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get noData;

  /// No description provided for @questions.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get questions;

  /// No description provided for @answers.
  ///
  /// In en, this message translates to:
  /// **'Answers'**
  String get answers;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get score;

  /// No description provided for @questionDetails.
  ///
  /// In en, this message translates to:
  /// **'Question Details'**
  String get questionDetails;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @creationDate.
  ///
  /// In en, this message translates to:
  /// **'Creation Date'**
  String get creationDate;

  /// No description provided for @contentLicense.
  ///
  /// In en, this message translates to:
  /// **'Content License'**
  String get contentLicense;

  /// No description provided for @linkQuestion.
  ///
  /// In en, this message translates to:
  /// **'Link Question'**
  String get linkQuestion;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @callApiFromPlugin.
  ///
  /// In en, this message translates to:
  /// **'Call Api From Plugin'**
  String get callApiFromPlugin;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @themeEnum.
  ///
  /// In en, this message translates to:
  /// **'{theme, select, system{System Preference} light{Light} dark{Dark} other{None}}'**
  String themeEnum(String theme);

  /// No description provided for @languageEnum.
  ///
  /// In en, this message translates to:
  /// **'{theme, select, english{English} arabic{العربية} other{None}}'**
  String languageEnum(String theme);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;
}

class _TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const _TranslationsDelegate();

  @override
  Future<Translations> load(Locale locale) {
    return SynchronousFuture<Translations>(lookupTranslations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_TranslationsDelegate old) => false;
}

Translations lookupTranslations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return TranslationsAr();
    case 'en': return TranslationsEn();
  }

  throw FlutterError(
    'Translations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
