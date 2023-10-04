import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double width;
  const Loader({Key? key, this.width = 4.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: width,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
