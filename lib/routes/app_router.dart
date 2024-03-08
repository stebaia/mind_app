import 'package:auto_route/annotations.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:mind_app/ui/pages/container_page.dart';
import 'package:mind_app/ui/pages/core_page.dart';
import 'package:mind_app/ui/pages/day_list_page.dart';
import 'package:mind_app/ui/pages/detail_mood_page.dart';
import 'package:mind_app/ui/pages/detail_mood_tip_page.dart';
import 'package:mind_app/ui/pages/empty_page.dart';
import 'package:mind_app/ui/pages/login_page.dart';
import 'package:mind_app/ui/pages/main_page.dart';
import 'package:mind_app/ui/pages/moodtips_list_page.dart';
import 'package:mind_app/ui/pages/profile_page.dart';
import 'package:mind_app/ui/pages/registration_page.dart';
import 'package:mind_app/ui/pages/secret_note_detail_page.dart';
import 'package:mind_app/ui/pages/secret_note_list.page.dart';
import 'package:mind_app/ui/pages/set_day_emoji_page.dart';
import 'package:mind_app/ui/pages/set_day_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: EmptyRouterPage, path: '/', children: [
    AutoRoute(
      page: MainPage,
      path: '',
    ),
    AutoRoute(page: LoginPage, path: 'login'),
    AutoRoute(page: RegistrationPage, path: 'registration'),
    AutoRoute(page: ContainerPage, path: 'container', children: [
      AutoRoute(
          page: EmptyRouterScreen,
          path: 'empty',
          name: 'TopBarContainerRouter',
          children: [
            AutoRoute(
              page: EmptyPage,
              path: '',
            ),
          ]),
      AutoRoute(page: ProfilePage, path: 'profile'),
      AutoRoute(page: CorePage, path: 'core_page'),
    ]),
    AutoRoute(page: SecretNoteDetailPage, path: 'secret_note_detail'),
    AutoRoute(page: SecretNoteListPage, path: 'secret_note_list'),
    AutoRoute(page: SetDayPage, path: 'set_day_page'),
    AutoRoute(page: DayListPage, path: 'day_list_page'),
    AutoRoute(page: DetailMoodPage, path: 'detail_mood_page'),
    AutoRoute(page: SetDayEmojiPage, path: 'set_day_emoji_page'),
    AutoRoute(page: MoodTipsListPage, path: 'mood_tips_list_page'),
    AutoRoute(page: MoodTipDetailPage, path: 'mood_tip_detail_page')
  ])

  /*
  ,*/
])
class $AppRouter {}
