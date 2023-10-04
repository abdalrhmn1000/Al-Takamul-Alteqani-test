import 'package:al_takamul_alteqani_test/core/presentation/pages/settings_page.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/routing/route_info.dart';
import 'package:al_takamul_alteqani_test/question/presentation/pages/question_details_page.dart';
import 'package:al_takamul_alteqani_test/question/presentation/pages/question_list_page.dart';

class Routes {
  Routes._();

  static Routes I = Routes._();

  final List<RouteInfo> routes = [
    RouteInfo(
      path: QuestionListPage.path,
      builder: (context, state, _) => const QuestionListPage(),
      routes: [
        RouteInfo(
          path: QuestionDetailsPage.path,
          builder: (context, state, _) =>
              QuestionDetailsPage(id: state.extra as int),
        ),
      ],
    ),
    RouteInfo(
      path: SettingsPage.path,
      builder: (context, state, _) => const SettingsPage(),
    ),
  ];
}
