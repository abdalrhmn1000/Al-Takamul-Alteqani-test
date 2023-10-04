import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RouteInfo {
  final String? path;
  final String? name;
  final String? iconPath;
  final Widget Function(
    BuildContext context,
    GoRouterState state,
    Widget? child,
  ) builder;
  final bool showInDrawer;
  final RouteType type;

  final List<RouteInfo>? routes;
  const RouteInfo({
    this.path,
    required this.builder,
    this.showInDrawer = false,
    this.type = RouteType.normal,
    this.iconPath,
    this.name,
    this.routes,
  });
}

enum RouteType { normal, shell }
