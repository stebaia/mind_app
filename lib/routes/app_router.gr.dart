// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i19;
import 'package:flutter/material.dart' as _i18;

import '../model/day.dart' as _i21;
import '../model/mood_improvment_tip.dart' as _i22;
import '../model/secret_note_model.dart' as _i20;
import '../ui/pages/container_page.dart' as _i5;
import '../ui/pages/core_page.dart' as _i14;
import '../ui/pages/day_list_page.dart' as _i9;
import '../ui/pages/detail_mood_page.dart' as _i10;
import '../ui/pages/detail_mood_tip_page.dart' as _i12;
import '../ui/pages/empty_page.dart' as _i16;
import '../ui/pages/login_page.dart' as _i3;
import '../ui/pages/main_page.dart' as _i2;
import '../ui/pages/moodtips_list_page.dart' as _i15;
import '../ui/pages/profile_page.dart' as _i13;
import '../ui/pages/registration_page.dart' as _i4;
import '../ui/pages/secret_note_detail_page.dart' as _i6;
import '../ui/pages/secret_note_list.page.dart' as _i7;
import '../ui/pages/set_day_emoji_page.dart' as _i11;
import '../ui/pages/set_day_page.dart' as _i8;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i2.MainPage()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i3.LoginPage()),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i4.RegistrationPage()),
      );
    },
    ContainerRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ContainerPage(),
      );
    },
    SecretNoteDetailRoute.name: (routeData) {
      final args = routeData.argsAs<SecretNoteDetailRouteArgs>(
          orElse: () => const SecretNoteDetailRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i6.SecretNoteDetailPage(
          key: args.key,
          secretModel: args.secretModel,
        )),
      );
    },
    SecretNoteListRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i7.SecretNoteListPage()),
      );
    },
    SetDayRoute.name: (routeData) {
      final args = routeData.argsAs<SetDayRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i8.SetDayPage(
          key: args.key,
          isFirstTime: args.isFirstTime,
          passedDay: args.passedDay,
        )),
      );
    },
    DayListRoute.name: (routeData) {
      final args = routeData.argsAs<DayListRouteArgs>(
          orElse: () => const DayListRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: _i9.DayListPage(key: args.key)),
      );
    },
    DetailMoodRoute.name: (routeData) {
      final args = routeData.argsAs<DetailMoodRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.DetailMoodPage(
          key: args.key,
          day: args.day,
        ),
      );
    },
    SetDayEmojiRoute.name: (routeData) {
      final args = routeData.argsAs<SetDayEmojiRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i11.SetDayEmojiPage(
          key: args.key,
          passedDay: args.passedDay,
          isFirstTime: args.isFirstTime,
        )),
      );
    },
    MoodTipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MoodTipDetailRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.MoodTipDetailPage(
          key: args.key,
          moodImprovementTip: args.moodImprovementTip,
        ),
      );
    },
    TopBarContainerRouter.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ProfilePage(),
      );
    },
    CoreRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i14.CorePage()),
      );
    },
    MoodTipsListRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.MoodTipsListPage(),
      );
    },
    EmptyRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.EmptyPage(),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i17.RouteConfig(
              MainRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              RegistrationRoute.name,
              path: 'registration',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              ContainerRoute.name,
              path: 'container',
              parent: EmptyRouterRoute.name,
              children: [
                _i17.RouteConfig(
                  TopBarContainerRouter.name,
                  path: 'empty',
                  parent: ContainerRoute.name,
                  children: [
                    _i17.RouteConfig(
                      EmptyRoute.name,
                      path: '',
                      parent: TopBarContainerRouter.name,
                    )
                  ],
                ),
                _i17.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile',
                  parent: ContainerRoute.name,
                ),
                _i17.RouteConfig(
                  CoreRoute.name,
                  path: 'core_page',
                  parent: ContainerRoute.name,
                ),
                _i17.RouteConfig(
                  MoodTipsListRoute.name,
                  path: 'mood_tips_list_page',
                  parent: ContainerRoute.name,
                ),
              ],
            ),
            _i17.RouteConfig(
              SecretNoteDetailRoute.name,
              path: 'secret_note_detail',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              SecretNoteListRoute.name,
              path: 'secret_note_list',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              SetDayRoute.name,
              path: 'set_day_page',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              DayListRoute.name,
              path: 'day_list_page',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              DetailMoodRoute.name,
              path: 'detail_mood_page',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              SetDayEmojiRoute.name,
              path: 'set_day_emoji_page',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              MoodTipDetailRoute.name,
              path: 'mood_tip_detail_page',
              parent: EmptyRouterRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i17.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationRoute extends _i17.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i5.ContainerPage]
class ContainerRoute extends _i17.PageRouteInfo<void> {
  const ContainerRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ContainerRoute.name,
          path: 'container',
          initialChildren: children,
        );

  static const String name = 'ContainerRoute';
}

/// generated route for
/// [_i6.SecretNoteDetailPage]
class SecretNoteDetailRoute
    extends _i17.PageRouteInfo<SecretNoteDetailRouteArgs> {
  SecretNoteDetailRoute({
    _i19.Key? key,
    _i20.SecretModel? secretModel,
  }) : super(
          SecretNoteDetailRoute.name,
          path: 'secret_note_detail',
          args: SecretNoteDetailRouteArgs(
            key: key,
            secretModel: secretModel,
          ),
        );

  static const String name = 'SecretNoteDetailRoute';
}

class SecretNoteDetailRouteArgs {
  const SecretNoteDetailRouteArgs({
    this.key,
    this.secretModel,
  });

  final _i19.Key? key;

  final _i20.SecretModel? secretModel;

  @override
  String toString() {
    return 'SecretNoteDetailRouteArgs{key: $key, secretModel: $secretModel}';
  }
}

/// generated route for
/// [_i7.SecretNoteListPage]
class SecretNoteListRoute extends _i17.PageRouteInfo<void> {
  const SecretNoteListRoute()
      : super(
          SecretNoteListRoute.name,
          path: 'secret_note_list',
        );

  static const String name = 'SecretNoteListRoute';
}

/// generated route for
/// [_i8.SetDayPage]
class SetDayRoute extends _i17.PageRouteInfo<SetDayRouteArgs> {
  SetDayRoute({
    _i19.Key? key,
    required bool isFirstTime,
    _i21.Day? passedDay,
  }) : super(
          SetDayRoute.name,
          path: 'set_day_page',
          args: SetDayRouteArgs(
            key: key,
            isFirstTime: isFirstTime,
            passedDay: passedDay,
          ),
        );

  static const String name = 'SetDayRoute';
}

class SetDayRouteArgs {
  const SetDayRouteArgs({
    this.key,
    required this.isFirstTime,
    this.passedDay,
  });

  final _i19.Key? key;

  final bool isFirstTime;

  final _i21.Day? passedDay;

  @override
  String toString() {
    return 'SetDayRouteArgs{key: $key, isFirstTime: $isFirstTime, passedDay: $passedDay}';
  }
}

/// generated route for
/// [_i9.DayListPage]
class DayListRoute extends _i17.PageRouteInfo<DayListRouteArgs> {
  DayListRoute({_i19.Key? key})
      : super(
          DayListRoute.name,
          path: 'day_list_page',
          args: DayListRouteArgs(key: key),
        );

  static const String name = 'DayListRoute';
}

class DayListRouteArgs {
  const DayListRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'DayListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.DetailMoodPage]
class DetailMoodRoute extends _i17.PageRouteInfo<DetailMoodRouteArgs> {
  DetailMoodRoute({
    _i19.Key? key,
    required _i21.Day day,
  }) : super(
          DetailMoodRoute.name,
          path: 'detail_mood_page',
          args: DetailMoodRouteArgs(
            key: key,
            day: day,
          ),
        );

  static const String name = 'DetailMoodRoute';
}

class DetailMoodRouteArgs {
  const DetailMoodRouteArgs({
    this.key,
    required this.day,
  });

  final _i19.Key? key;

  final _i21.Day day;

  @override
  String toString() {
    return 'DetailMoodRouteArgs{key: $key, day: $day}';
  }
}

/// generated route for
/// [_i11.SetDayEmojiPage]
class SetDayEmojiRoute extends _i17.PageRouteInfo<SetDayEmojiRouteArgs> {
  SetDayEmojiRoute({
    _i19.Key? key,
    _i21.Day? passedDay,
    required bool isFirstTime,
  }) : super(
          SetDayEmojiRoute.name,
          path: 'set_day_emoji_page',
          args: SetDayEmojiRouteArgs(
            key: key,
            passedDay: passedDay,
            isFirstTime: isFirstTime,
          ),
        );

  static const String name = 'SetDayEmojiRoute';
}

class SetDayEmojiRouteArgs {
  const SetDayEmojiRouteArgs({
    this.key,
    this.passedDay,
    required this.isFirstTime,
  });

  final _i19.Key? key;

  final _i21.Day? passedDay;

  final bool isFirstTime;

  @override
  String toString() {
    return 'SetDayEmojiRouteArgs{key: $key, passedDay: $passedDay, isFirstTime: $isFirstTime}';
  }
}

/// generated route for
/// [_i12.MoodTipDetailPage]
class MoodTipDetailRoute extends _i17.PageRouteInfo<MoodTipDetailRouteArgs> {
  MoodTipDetailRoute({
    _i19.Key? key,
    required _i22.MoodImprovementTip moodImprovementTip,
  }) : super(
          MoodTipDetailRoute.name,
          path: 'mood_tip_detail_page',
          args: MoodTipDetailRouteArgs(
            key: key,
            moodImprovementTip: moodImprovementTip,
          ),
        );

  static const String name = 'MoodTipDetailRoute';
}

class MoodTipDetailRouteArgs {
  const MoodTipDetailRouteArgs({
    this.key,
    required this.moodImprovementTip,
  });

  final _i19.Key? key;

  final _i22.MoodImprovementTip moodImprovementTip;

  @override
  String toString() {
    return 'MoodTipDetailRouteArgs{key: $key, moodImprovementTip: $moodImprovementTip}';
  }
}

/// generated route for
/// [_i1.EmptyRouterScreen]
class TopBarContainerRouter extends _i17.PageRouteInfo<void> {
  const TopBarContainerRouter({List<_i17.PageRouteInfo>? children})
      : super(
          TopBarContainerRouter.name,
          path: 'empty',
          initialChildren: children,
        );

  static const String name = 'TopBarContainerRouter';
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i14.CorePage]
class CoreRoute extends _i17.PageRouteInfo<void> {
  const CoreRoute()
      : super(
          CoreRoute.name,
          path: 'core_page',
        );

  static const String name = 'CoreRoute';
}

/// generated route for
/// [_i15.MoodTipsListPage]
class MoodTipsListRoute extends _i17.PageRouteInfo<void> {
  const MoodTipsListRoute()
      : super(
          MoodTipsListRoute.name,
          path: 'mood_tips_list_page',
        );

  static const String name = 'MoodTipsListRoute';
}

/// generated route for
/// [_i16.EmptyPage]
class EmptyRoute extends _i17.PageRouteInfo<void> {
  const EmptyRoute()
      : super(
          EmptyRoute.name,
          path: '',
        );

  static const String name = 'EmptyRoute';
}
