import 'dart:io';

import 'package:al_takamul_alteqani_test/core/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:al_takamul_alteqani_test/core/presentation/cubits/theme_cubit/theme_cubit.dart';
import 'package:al_takamul_alteqani_test/injection.dart';
import 'package:al_takamul_alteqani_test/question/presentation/pages/question_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/routing/route_info.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/routing/routes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver{
  String activeLanguage = Platform.localeName.substring(0, 2);
  ThemeMode themeMode =
  (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.light)
      ? ThemeMode.light
      : ThemeMode.dark;
  @override
  void didChangeLocales(List<Locale>? locales) {

    super.didChangeLocales(locales);
    // Here locales is a list of all the locales enabled on the device.
    // Like: [Locale('en_US'), Locale('ar_SA')]
    // The first locale is the phone's main locale, but in reality you should
    // traverse until you find a supported locale.
    setState(() {
      activeLanguage = locales?.first.languageCode ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeCubit>()..getThemeMode(),
        ),
        BlocProvider(
          create: (context) => getIt<LanguageCubit>()..getLanguage(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<LanguageCubit, LanguageState>(
            listener: (context, state) async {
              if (state is SetLanguage) {
                setState(() {
                  activeLanguage = state.lang.substring(0, 2);
                });
                debugPrint("set language to ${state.lang}"
                    "--------------------------------------------------------------------\n\n\n");
              }
              if (state is GetLanguage) {
                if (state.lang != null) {
                  setState(() {
                    activeLanguage = state.lang!.substring(0, 2);
                  });
                }
              }
            },
          ),
          BlocListener<ThemeCubit, ThemeState>(
            listener: (context, state) {
              if (state is SetTheme) {
                setState(() {
                  themeMode = state.mode;
                });

                debugPrint("set theme to ${state.mode}"
                    "--------------------------------------------------------------------\n\n\n");
              }
              if (state is GetThemeMode) {
                if (state.themeMode != null) {
                  setState(() {
                    themeMode = state.themeMode == ThemeMode.light
                        ? ThemeMode.light
                        : state.themeMode == ThemeMode.dark
                        ? ThemeMode.dark
                        : ThemeMode.system;
                  });
                }
              }
            },
          ),
        ],
        child: Builder(
          builder: (context) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              builder: (_, child) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: Translations.localizationsDelegates,
                supportedLocales: Translations.supportedLocales,
                theme:
                    Theme.of(context).appTheme(Brightness.light).getThemeData(context),
                darkTheme:
                    Theme.of(context).appTheme(Brightness.dark).getThemeData(context),
                themeMode: BlocProvider.of<ThemeCubit>(context).themeMode ==
                    ThemeMode.system
                    ? ThemeMode.system
                    : themeMode,
                locale: Locale.fromSubtags(languageCode: activeLanguage),
                builder: (context, widget) {
                  double textScale = MediaQuery.of(context).textScaleFactor > 1.2
                      ? 1.2
                      : MediaQuery.of(context).textScaleFactor;
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: textScale),
                    child: Builder(
                      builder: (context) {
                        if (widget == null) {
                          return const SizedBox();
                        }
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: ScrollConfiguration(
                            behavior: const ScrollBehavior().copyWith(
                              physics: const BouncingScrollPhysics(),
                            ),
                            child: SafeArea(
                              top: false,
                              left: false,
                              right: false,
                              child: widget,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                routerConfig: _goRouterConfig,
              ),
            );
          }
        ),
      ),
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _goRouterConfig = GoRouter(
  initialLocation: QuestionListPage.path,
  navigatorKey: _rootNavigatorKey,
  routes: _getRoutes(Routes.I.routes),
);

List<RouteBase> _getRoutes(List<RouteInfo>? routes) => (routes ?? []).map(
      (subRoute) {
        if (subRoute.type == RouteType.shell) {
          return ShellRoute(
            builder: (context, state, child) =>
                subRoute.builder(context, state, child),
            routes: _getRoutes(subRoute.routes),
          );
        }
        return GoRoute(
          // parentNavigatorKey: _rootNavigatorKey,
          path: subRoute.path!,
          name: subRoute.name ?? subRoute.path,
          builder: (context, state) => subRoute.builder(context, state, null),
          routes: _getRoutes(subRoute.routes),
        );
      },
    ).toList();
