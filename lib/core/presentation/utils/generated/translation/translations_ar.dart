import 'package:intl/intl.dart' as intl;

import 'translations.dart';

/// The translations for Arabic (`ar`).
class TranslationsAr extends Translations {
  TranslationsAr([String locale = 'ar']) : super(locale);

  @override
  String get success => 'تم';

  @override
  String get retry => 'اعادة محاولة';

  @override
  String get errorMessage => 'يوجد خطأ ما';

  @override
  String get noInternetConnectionMessage => 'لا يوجد اتصال بالإنترنت';

  @override
  String get accessDeniedMessage => 'تم رفض الوصول، ليس لديك امتيازات كافية';

  @override
  String get noInternetConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get unauthenticatedMessage => 'انتهت صلاحية الجلسة!';

  @override
  String get noData => 'لايوجد بيانات';

  @override
  String get questions => 'الأسئلة';

  @override
  String get answers => 'الإجابات';

  @override
  String get score => 'نتيجة';

  @override
  String get questionDetails => 'تفاصيل السؤال';

  @override
  String get question => 'السؤال';

  @override
  String get tags => 'العلامات';

  @override
  String get creationDate => 'تاريخ الإنشاء';

  @override
  String get contentLicense => 'ترخيص المحتوى';

  @override
  String get linkQuestion => 'رابط السؤال';

  @override
  String get settings => 'الإعدادات';

  @override
  String get callApiFromPlugin => 'Call Api From Plugin';

  @override
  String get theme => 'السمة';

  @override
  String get language => 'اللغة';

  @override
  String themeEnum(String theme) {
    String _temp0 = intl.Intl.selectLogic(
      theme,
      {
        'system': 'لغة النظام',
        'light': 'اضائة',
        'dark': 'داكن',
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
        'english': 'الانجليزية',
        'arabic': 'العربية',
        'other': 'None',
      },
    );
    return '$_temp0';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get done => 'انتهاء';
}
