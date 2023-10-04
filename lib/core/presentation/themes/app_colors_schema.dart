import 'package:flutter/material.dart';

part 'material_colors.dart';

abstract class AppColorScheme {
  Brightness get brightness;

  MaterialPrimaryColor get primaryColor;

  Color get secondaryColor => const Color(0xff79B8FF);

  Color get whiteColor => Colors.white;

  Color get blackColor => Colors.black;

  Color get darkGreyColor => const Color(0xff202225);

  MaterialColor get greyColor;

  MaterialTextColor get textColor;

  Color get backgroundColor;

  Color get topAndNav;

  Map<DividerColor, Color> get divider;

  Map<StatusColor, Color> get red;

  Map<StatusColor, Color> get blue;

  Map<StatusColor, Color> get green;

  Map<StatusColor, Color> get orange;

  Map<InputColor, Color> get input;

  Color get placeholderColor;

  Color get cardBackgroundColor;

  Color get iconTintColor;

  Color get infoTextColor;

  Color get errorColor;

  Color get drawerColor;

  Color get shimmerBaseColor;

  Color get shimmerHighlightColor;
}

class AppLightColors extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  MaterialPrimaryColor get primaryColor => const MaterialPrimaryColor(
        0xff1E8744,
        <PrimaryColor, Color>{
          PrimaryColor.tint5: Color(0xffF3F9F5),
          PrimaryColor.tint10: Color(0xffD2E7DA),
          PrimaryColor.tint30: Color(0xffE8F2FF),
          PrimaryColor.tint50: Color(0xffF3F8FF),
        },
      );

  @override
  MaterialColor get greyColor => const MaterialColor(
        0xFFABADB1,
        <int, Color>{
          5: Color(0xffFBFBFB),
          10: Color(0xffEEEFEE),
          20: Color(0xffE3E5E3),
        },
      );

  @override
  MaterialTextColor get textColor => const MaterialTextColor(
        0xff000000,
        <TextColor, Color>{
          TextColor.adaptiveGrey: Color(0xff7A7A7A),
          TextColor.grey: Color(0xffB9BBBA),
          TextColor.white: Color(0xffFFFFFF),
        },
      );

  @override
  Color get backgroundColor => const Color(0xffF4F6F3);

  @override
  Color get topAndNav => backgroundColor;

  @override
  Map<DividerColor, Color> get divider => {
        DividerColor.onCard: const Color(0xffEDEDED),
        DividerColor.onPrimary: const Color(0xff146FED),
        DividerColor.onBG: const Color(0xffE2E3E4),
      };

  @override
  Color get cardBackgroundColor => const Color(0xffffffff);

  @override
  Color get iconTintColor => const Color(0xff000000);

  @override
  Color get placeholderColor => const Color(0xffabadb1);

  @override
  Color get infoTextColor => const Color(0xff979797);

  @override
  Color get errorColor => const Color(0xfff44336);

  @override
  Map<InputColor, Color> get input => {
        InputColor.borderColor: primaryColor,
        InputColor.fillColor: whiteColor,
        InputColor.labelColor: darkGreyColor,
        InputColor.placeHolderColor: placeholderColor,
      };

  @override
  Color get drawerColor => primaryColor;

  @override
  Color get shimmerBaseColor => const Color(0xFFEEEEEE);

  @override
  Color get shimmerHighlightColor => const Color(0xFFCCCCCC);

  @override
  Map<StatusColor, Color> get blue => {
        StatusColor.tint5: const Color(0xffE8F2FF),
        StatusColor.tint50: const Color(0xff3D8EFF),
        StatusColor.original: const Color(0xff1677FF),
        StatusColor.shade70: const Color(0xff0F4FAA),
      };

  @override
  Map<StatusColor, Color> get green => {
        StatusColor.tint5: const Color(0xffE8F8EF),
        StatusColor.tint50: const Color(0xff3EC475),
        StatusColor.original: const Color(0xff18B85A),
      };

  @override
  Map<StatusColor, Color> get orange => {
        StatusColor.original: const Color(0xffFAAD14),
        StatusColor.tint5: const Color(0xffFFF7E8),
      };

  @override
  Map<StatusColor, Color> get red => {
        StatusColor.tint5: const Color(0xffFDEDED),
        StatusColor.tint50: const Color(0xffEE6565),
        StatusColor.original: const Color(0xffEB4646),
        StatusColor.shade70: const Color(0xff9D2F2F),
      };
}

class AppDarkColors extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  MaterialPrimaryColor get primaryColor => const MaterialPrimaryColor(
        0xff1677FF,
        <PrimaryColor, Color>{
          PrimaryColor.shade60: Color(0xff197139),
          PrimaryColor.shade70: Color(0xff145A2D),
          PrimaryColor.shade80: Color(0xff0F4422),
        },
      );

  @override
  MaterialColor get greyColor => const MaterialColor(
        0xFFABADB1,
        <int, Color>{
          50: Color(0xff65676A),
          30: Color(0xff494C4F),
          20: Color(0xff3C3E41),
        },
      );

  @override
  MaterialTextColor get textColor => const MaterialTextColor(
        0xFFFFFFFF,
        <TextColor, Color>{
          TextColor.adaptiveGrey: Color(0xffdedfe0),
          TextColor.grey: Color(0xffABADB1),
          TextColor.white: Color(0xffFFFFFF),
        },
      );

  @override
  Color get backgroundColor => const Color(0xff101315);

  @override
  Color get topAndNav => backgroundColor;

  @override
  Map<DividerColor, Color> get divider => {
        DividerColor.onCard: const Color(0xff343638),
        DividerColor.onPrimary: const Color(0xff398BFF),
        DividerColor.onBG: const Color(0xff343638),
      };

  @override
  Color get cardBackgroundColor => const Color(0xff202225);

  @override
  Color get iconTintColor => const Color(0xffececec);

  @override
  Color get placeholderColor => const Color(0xffa3a3a4);

  @override
  Color get infoTextColor => const Color(0xff979797);

  @override
  Color get errorColor => const Color(0xffc00606);

  @override
  Map<InputColor, Color> get input => {
        InputColor.borderColor: primaryColor,
        InputColor.fillColor: darkGreyColor,
        InputColor.labelColor: whiteColor,
        InputColor.placeHolderColor: placeholderColor,
      };

  @override
  Color get drawerColor => iconTintColor;

  @override
  Color get shimmerBaseColor => const Color(0xFF323232);

  @override
  Color get shimmerHighlightColor => const Color(0xFF1E1E1E);

  @override
  Map<StatusColor, Color> get blue => {
        StatusColor.tint5: const Color(0xffE8F2FF),
        StatusColor.tint50: const Color(0xff3D8EFF),
        StatusColor.original: const Color(0xff1677FF),
        StatusColor.shade70: const Color(0xff0F4FAA),
      };

  @override
  Map<StatusColor, Color> get green => {
        StatusColor.tint5: const Color(0xffE8F8EF),
        StatusColor.tint50: const Color(0xff3EC475),
        StatusColor.original: const Color(0xff18B85A),
      };

  @override
  Map<StatusColor, Color> get orange => {
        StatusColor.original: const Color(0xffFAAD14),
        StatusColor.tint5: const Color(0xffFFF7E8),
      };

  @override
  Map<StatusColor, Color> get red => {
        StatusColor.tint5: const Color(0xffFDEDED),
        StatusColor.tint50: const Color(0xffEE6565),
        StatusColor.original: const Color(0xffEB4646),
        StatusColor.shade70: const Color(0xff9D2F2F),
      };
}
