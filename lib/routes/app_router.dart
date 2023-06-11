import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:mind_app/ui/pages/core_page.dart';
import 'package:mind_app/ui/pages/day_list_page.dart';
import 'package:mind_app/ui/pages/login_page.dart';
import 'package:mind_app/ui/pages/main_page.dart';
import 'package:mind_app/ui/pages/profile_page.dart';
import 'package:mind_app/ui/pages/registration_page.dart';
import 'package:mind_app/ui/pages/secret_note_detail_page.dart';
import 'package:mind_app/ui/pages/secret_note_list.page.dart';
import 'package:mind_app/ui/pages/set_day_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: EmptyRouterPage, path: '/', children: [
    AutoRoute(
      page: MainPage,
      path: '',
    ),
    AutoRoute(page: LoginPage, path: 'login'),
    AutoRoute(page: ProfilePage, path: 'profile'),
    AutoRoute(page: RegistrationPage, path: 'registration'),
    AutoRoute(page: CorePage, path: 'core_page'),
    AutoRoute(page: SecretNoteDetailPage, path: 'secret_note_detail'),
    AutoRoute(page: SecretNoteListPage, path: 'secret_note_list'),
    AutoRoute(page: SetDayPage, path: 'set_day_page'),
    AutoRoute(page: DayListPage, path: 'day_list_page')
  ])

  /*
  ,*/
])
class $AppRouter {}
