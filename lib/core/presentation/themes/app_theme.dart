import 'dart:math';

import 'package:flutter/material.dart';
import 'package:al_takamul_alteqani_test/core/presentation/themes/app_colors_schema.dart';

class AppTheme {
  final AppColorScheme _appColorScheme;
  AppTheme(this._appColorScheme);

  AppColorScheme get appColorScheme => _appColorScheme;

  ThemeData getThemeData(BuildContext context) {
    return ThemeData(
      brightness: _appColorScheme.brightness,
      primarySwatch: _generatePrimaryMaterialColor(),
      primaryColor: _appColorScheme.primaryColor,
      scaffoldBackgroundColor: _appColorScheme.backgroundColor,
      cardColor: _appColorScheme.cardBackgroundColor,
      cardTheme: const CardTheme(
          margin: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      canvasColor: _appColorScheme.cardBackgroundColor,
      focusColor: _appColorScheme.infoTextColor,
      dividerColor: _appColorScheme.divider[DividerColor.onCard],
      hintColor: _appColorScheme.placeholderColor,
      indicatorColor: _appColorScheme.secondaryColor,
      disabledColor: _appColorScheme.placeholderColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: _appColorScheme.secondaryColor,
        selectionColor: _appColorScheme.secondaryColor.withOpacity(0.5),
        cursorColor: _appColorScheme.secondaryColor,
      ),
      colorScheme: ColorScheme(
        primary: _appColorScheme.primaryColor,
        secondary: Colors.transparent,
        brightness: _appColorScheme.brightness,
        onPrimary: _appColorScheme.textColor,
        onSecondary: _appColorScheme.textColor,
        error: _appColorScheme.errorColor,
        onError: _appColorScheme.textColor,
        background: _appColorScheme.backgroundColor,
        onBackground: _appColorScheme.textColor,
        surface: _appColorScheme.cardBackgroundColor,
        onSurface: _appColorScheme.textColor,
      ),
      useMaterial3: true,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appColorScheme.primaryColor,
        foregroundColor: appColorScheme.whiteColor,
        elevation: 0.0,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: _appColorScheme.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _appColorScheme.cardBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: _appColorScheme.iconTintColor),
      primaryIconTheme: IconThemeData(color: _appColorScheme.iconTintColor),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _appColorScheme.secondaryColor,
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all(_appColorScheme.primaryColor),
      )),
      appBarTheme: AppBarTheme(
        elevation: 0,
        toolbarHeight: 70,
        titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: _appColorScheme.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
        backgroundColor: _appColorScheme.topAndNav,
        iconTheme: IconThemeData(color: _appColorScheme.iconTintColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: _appColorScheme.backgroundColor,
        labelStyle: TextStyle(
          color: _appColorScheme.infoTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          color: _appColorScheme.infoTextColor,
        ),
        floatingLabelStyle: TextStyle(
          color: _appColorScheme.infoTextColor,
          fontSize: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.input[InputColor.borderColor]!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        prefixIconColor: _appColorScheme.greyColor,
        suffixIconColor: _appColorScheme.greyColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: appColorScheme.greyColor[20]!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: appColorScheme.greyColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.errorColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.errorColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        filled: false,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor:
              MaterialStatePropertyAll(_appColorScheme.primaryColor),
          minimumSize: MaterialStateProperty.all(const Size(32, 32)),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
          overlayColor: MaterialStateProperty.all(
              _appColorScheme.textColor.withAlpha(50)),
          foregroundColor:
              MaterialStateProperty.all(_appColorScheme.textColor.white),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: _appColorScheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: _appColorScheme.placeholderColor,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: _appColorScheme.divider[DividerColor.onBG],
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
          foregroundColor:
              MaterialStateProperty.all(_appColorScheme.primaryColor),
          backgroundColor:
              MaterialStateProperty.all(_appColorScheme.backgroundColor),
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(
              BorderSide(color: _appColorScheme.primaryColor)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: _appColorScheme.primaryColor),
            borderRadius: BorderRadius.circular(8),
          )),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: _appColorScheme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
        ),
      ),
      unselectedWidgetColor: _appColorScheme.infoTextColor,
      checkboxTheme: CheckboxThemeData(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _appColorScheme.primaryColor;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _appColorScheme.primaryColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _appColorScheme.primaryColor;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return _appColorScheme.primaryColor;
          }
          return null;
        }),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: _appColorScheme.primaryColor,
        indicatorColor: _appColorScheme.primaryColor,
        unselectedLabelColor: _appColorScheme.placeholderColor,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          letterSpacing: .15,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          letterSpacing: .1,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          letterSpacing: .1,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          letterSpacing: .5,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          letterSpacing: .5,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          letterSpacing: .5,
          fontWeight: FontWeight.w700
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          letterSpacing: .25,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          letterSpacing: .4,
        ),
      ),
    );
  }

  MaterialColor _generatePrimaryMaterialColor() {
    return MaterialColor(appColorScheme.primaryColor.value, {
      50: _tintColor(appColorScheme.secondaryColor, 0.9),
      100: _tintColor(appColorScheme.secondaryColor, 0.8),
      200: _tintColor(appColorScheme.secondaryColor, 0.6),
      300: _tintColor(appColorScheme.secondaryColor, 0.4),
      400: _tintColor(appColorScheme.secondaryColor, 0.2),
      500: appColorScheme.secondaryColor,
      600: _shadeColor(appColorScheme.primaryColor, 0.1),
      700: _shadeColor(appColorScheme.primaryColor, 0.2),
      800: _shadeColor(appColorScheme.primaryColor, 0.3),
      900: _shadeColor(appColorScheme.primaryColor, 0.4),
    });
  }

  int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}

extension GetAppColorTheme on ThemeData {
  AppTheme appTheme([Brightness? brightness]) {
    late AppColorScheme appColorScheme;
    if ((brightness ?? this.brightness) == Brightness.light) {
      appColorScheme = AppLightColors();
    } else {
      appColorScheme = AppDarkColors();
    }
    return AppTheme(appColorScheme);
  }

  Theme datePickerDialogTheme(BuildContext context, Widget? widget) => Theme(
        data: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.primary),
          dividerColor: Colors.grey,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Theme.of(context).colorScheme.primary,
                onPrimary: Theme.of(context).appColors.textColor.white,
                onSurface: Theme.of(context).textTheme.bodyLarge!.color,
              ),
        ),
        child: widget!,
      );

  AppColorScheme get appColors {
    return appTheme().appColorScheme;
  }

  Color customColorMode({
    required Color inDarkMode,
    required Color inLightMode,
  }) =>
      brightness == Brightness.light ? inLightMode : inDarkMode;
}
