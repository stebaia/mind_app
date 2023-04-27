import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:mind_app/ui/pages/login_page.dart';
import 'package:mind_app/ui/pages/main_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: EmptyRouterPage, path: '/', children: [
    AutoRoute(
      page: MainPage,
      path: '',
    ),
    AutoRoute(page: LoginPage, path: 'login'),
  ])

  /*
  ,*/
])
class $AppRouter {}
