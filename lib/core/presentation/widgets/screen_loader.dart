import 'dart:ui';

import 'package:flutter/material.dart';

mixin ScreenLoader<T extends StatefulWidget> on State<T> {
  bool isLoading = false;
  static Widget? _globalLoader;
  static double? _globalLoadingBgBlur = 5.0;

  /// starts the [loader]
  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  /// stops the [loader]
  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  /// override [loadingBgBlur] if you wish to change blur value in specific view
  double? loadingBgBlur() {
    return null;
  }

  double _loadingBgBlur() {
    return loadingBgBlur() ?? ScreenLoader._globalLoadingBgBlur ?? 5.0;
  }

  /// override [loader] if you wish to add custom loader in specific view
  Widget? loader() {
    return null;
  }

  Widget _loader() {
    return loader() ??
        ScreenLoader._globalLoader ??
        CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        );
  }

  Widget _buildLoader() {
    if (isLoading) {
      return Container(
        color: Colors.transparent,
        child: Center(
          child: _loader(),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget screen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        screen(context),
        if (!isLoading) _buildLoader(),
        if (isLoading)
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: _loadingBgBlur(),
              sigmaY: _loadingBgBlur(),
            ),
            child: _buildLoader(),
          ),
      ],
    );
  }
}

/// [ScreenLoaderApp] is used to provide global settings for the screen loader
class ScreenLoaderApp extends StatelessWidget {
  final MaterialApp app;
  final Widget? globalLoader;
  final double? globalLoadingBgBlur;

  const ScreenLoaderApp({
    Key? key,
    required this.app,
    this.globalLoader,
    this.globalLoadingBgBlur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenLoader._globalLoader = globalLoader;
    ScreenLoader._globalLoadingBgBlur = globalLoadingBgBlur;
    return app;
  }
}
