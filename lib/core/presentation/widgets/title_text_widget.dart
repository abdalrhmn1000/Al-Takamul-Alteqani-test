import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;

  const TitleTextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
          fontFamily: 'asasas'
        ),
      ),
    );
  }
}
