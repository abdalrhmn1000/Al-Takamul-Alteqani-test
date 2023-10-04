import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  final String title;
  final String body;

  const CustomTextRich({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: '$title: ',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).appColors.textColor.grey),
        ),
        TextSpan(
          text: body,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).appColors.textColor),
        ),
      ])),
    );
  }
}
