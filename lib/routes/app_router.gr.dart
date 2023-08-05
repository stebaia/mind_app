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
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i15;
import 'package:flutter/material.dart' as _i14;

import '../model/day.dart' as _i16;
import '../ui/pages/core_page.dart' as _i6;
import '../ui/pages/day_list_page.dart' as _i10;
import '../ui/pages/detail_mood_page.dart' as _i11;
import '../ui/pages/login_page.dart' as _i3;
import '../ui/pages/main_page.dart' as _i2;
import '../ui/pages/profile_page.dart' as _i4;
import '../ui/pages/registration_page.dart' as _i5;
import '../ui/pages/secret_note_detail_page.dart' as _i7;
import '../ui/pages/secret_note_list.page.dart' as _i8;
import '../ui/pages/set_day_emoji_page.dart' as _i12;
import '../ui/pages/set_day_page.dart' as _i9;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i2.MainPage()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i3.LoginPage()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfilePage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i5.RegistrationPage()),
      );
    },
    CoreRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i6.CorePage()),
      );
    },
    SecretNoteDetailRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SecretNoteDetailPage(),
      );
    },
    SecretNoteListRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.SecretNoteListPage(),
      );
    },
    SetDayRoute.name: (routeData) {
      final args = routeData.argsAs<SetDayRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(
            child: _i9.SetDayPage(
          key: args.key,
          isFirstTime: args.isFirstTime,
          passedDay: args.passedDay,
        )),
      );
    },
    DayListRoute.name: (routeData) {
      final args = routeData.argsAs<DayListRouteArgs>(
          orElse: () => const DayListRouteArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: _i10.DayListPage(key: args.key)),
      );
    },
    DetailMoodRoute.name: (routeData) {
      final args = routeData.argsAs<DetailMoodRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DetailMoodPage(
          key: args.key,
          day: args.day,
        ),
      );
    },
    SetDayEmojiRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i12.SetDayEmojiPage()),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i13.RouteConfig(
              MainRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              RegistrationRoute.name,
              path: 'registration',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              CoreRoute.name,
              path: 'core_page',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              SecretNoteDetailRoute.name,
              path: 'secret_note_detail',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              SecretNoteListRoute.name,
              path: 'secret_note_list',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              SetDayRoute.name,
              path: 'set_day_page',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              DayListRoute.name,
              path: 'day_list_page',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              DetailMoodRoute.name,
              path: 'detail_mood_page',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              SetDayEmojiRoute.name,
              path: 'set_day_emoji_page',
              parent: EmptyRouterRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i13.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.RegistrationPage]
class RegistrationRoute extends _i13.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i6.CorePage]
class CoreRoute extends _i13.PageRouteInfo<void> {
  const CoreRoute()
      : super(
          CoreRoute.name,
          path: 'core_page',
        );

  static const String name = 'CoreRoute';
}

/// generated route for
/// [_i7.SecretNoteDetailPage]
class SecretNoteDetailRoute extends _i13.PageRouteInfo<void> {
  const SecretNoteDetailRoute()
      : super(
          SecretNoteDetailRoute.name,
          path: 'secret_note_detail',
        );

  static const String name = 'SecretNoteDetailRoute';
}

/// generated route for
/// [_i8.SecretNoteListPage]
class SecretNoteListRoute extends _i13.PageRouteInfo<void> {
  const SecretNoteListRoute()
      : super(
          SecretNoteListRoute.name,
          path: 'secret_note_list',
        );

  static const String name = 'SecretNoteListRoute';
}

/// generated route for
/// [_i9.SetDayPage]
class SetDayRoute extends _i13.PageRouteInfo<SetDayRouteArgs> {
  SetDayRoute({
    _i15.Key? key,
    required bool isFirstTime,
    _i16.Day? passedDay,
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

  final _i15.Key? key;

  final bool isFirstTime;

  final _i16.Day? passedDay;

  @override
  String toString() {
    return 'SetDayRouteArgs{key: $key, isFirstTime: $isFirstTime, passedDay: $passedDay}';
  }
}

/// generated route for
/// [_i10.DayListPage]
class DayListRoute extends _i13.PageRouteInfo<DayListRouteArgs> {
  DayListRoute({_i15.Key? key})
      : super(
          DayListRoute.name,
          path: 'day_list_page',
          args: DayListRouteArgs(key: key),
        );

  static const String name = 'DayListRoute';
}

class DayListRouteArgs {
  const DayListRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'DayListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.DetailMoodPage]
class DetailMoodRoute extends _i13.PageRouteInfo<DetailMoodRouteArgs> {
  DetailMoodRoute({
    _i15.Key? key,
    required _i16.Day day,
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

  final _i15.Key? key;

  final _i16.Day day;

  @override
  String toString() {
    return 'DetailMoodRouteArgs{key: $key, day: $day}';
  }
}

/// generated route for
/// [_i12.SetDayEmojiPage]
class SetDayEmojiRoute extends _i13.PageRouteInfo<void> {
  const SetDayEmojiRoute()
      : super(
          SetDayEmojiRoute.name,
          path: 'set_day_emoji_page',
        );

  static const String name = 'SetDayEmojiRoute';
}
