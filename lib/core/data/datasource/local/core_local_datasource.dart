import 'package:al_takamul_alteqani_test/core/data/utils/constants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CoreLocalDatasource {
  String? getThemeMode();

  void setThemeMode({required String themeMode});

  String? getLanguage();

  void setLanguage({required String language});
}

@LazySingleton(as: CoreLocalDatasource)
class AuthLocalDatasourceImpl implements CoreLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl(this.sharedPreferences);

  @override
  String? getThemeMode() {
    return sharedPreferences.getString(SharedPreferencesKeys.themeMode);
  }

  @override
  String? getLanguage() {
    return sharedPreferences.getString(SharedPreferencesKeys.language);
  }

  @override
  void setThemeMode({required  String themeMode}) {
    sharedPreferences.setString(
      SharedPreferencesKeys.themeMode,
       themeMode,
    );
  }

  @override
  void setLanguage({required String language}) {
    sharedPreferences.setString(
      SharedPreferencesKeys.language,
      language,
    );
  }
}
