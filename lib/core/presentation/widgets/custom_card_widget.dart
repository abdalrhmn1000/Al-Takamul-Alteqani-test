import 'package:flutter/material.dart';
import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;

  const CustomCardWidget({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? Theme.of(context).appColors.greyColor[20]!,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(14),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
