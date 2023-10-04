part of 'app_colors_schema.dart';

///create a [MaterialTextColor] class that has a related colors with enums [TextColor]
class MaterialTextColor extends ColorSwatch<TextColor> {
  const MaterialTextColor(super.primary, super.swatch);

  Color get adaptiveGrey => this[TextColor.adaptiveGrey]!;

  Color get grey => this[TextColor.grey]!;

  Color get white => this[TextColor.white]!;
}

enum TextColor {
  adaptiveGrey,
  grey,
  white,
}

///create a [MaterialSecondaryColor] class that has a related colors with enums [PrimaryColor]
class MaterialPrimaryColor extends ColorSwatch<PrimaryColor> {
  const MaterialPrimaryColor(super.primary, super.swatch);

  Color get shade60 => this[PrimaryColor.shade60] ?? _transparentColor;

  Color get shade70 => this[PrimaryColor.shade70] ?? _transparentColor;

  Color get shade80 => this[PrimaryColor.shade80] ?? _transparentColor;

  Color get tint5 => this[PrimaryColor.tint5] ?? _transparentColor;

  Color get tint10 => this[PrimaryColor.tint10] ?? _transparentColor;

  Color get tint30 => this[PrimaryColor.tint30] ?? _transparentColor;

  Color get tint50 => this[PrimaryColor.tint50] ?? _transparentColor;

  Color get _transparentColor => Colors.transparent;
}

enum PrimaryColor {
  shade60,
  shade70,
  shade80,
  tint5,
  tint10,
  tint30,
  tint50,
}

///create a [DividerColor] enum for the divider colors status in different UI
enum DividerColor {
  onCard,
  onPrimary,
  onBG,
}

///create a [StatusColor] enum for the status colors status in different UI
enum StatusColor {
  tint5,
  tint50,
  original,
  shade70,
}

///create a [InputColor] enum for the status colors status in different UI
enum InputColor {
  borderColor,
  placeHolderColor,
  fillColor,
  labelColor,
}
