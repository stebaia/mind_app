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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i13;
import 'package:flutter/material.dart' as _i12;

import '../ui/pages/core_page.dart' as _i6;
import '../ui/pages/day_list_page.dart' as _i10;
import '../ui/pages/login_page.dart' as _i3;
import '../ui/pages/main_page.dart' as _i2;
import '../ui/pages/profile_page.dart' as _i4;
import '../ui/pages/registration_page.dart' as _i5;
import '../ui/pages/secret_note_detail_page.dart' as _i7;
import '../ui/pages/secret_note_list.page.dart' as _i8;
import '../ui/pages/set_day_page.dart' as _i9;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i2.MainPage()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i3.LoginPage()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfilePage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i5.RegistrationPage()),
      );
    },
    CoreRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i6.CorePage()),
      );
    },
    SecretNoteDetailRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SecretNoteDetailPage(),
      );
    },
    SecretNoteListRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.SecretNoteListPage(),
      );
    },
    SetDayRoute.name: (routeData) {
      final args = routeData.argsAs<SetDayRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(
            child: _i9.SetDayPage(
          key: args.key,
          isFirstTime: args.isFirstTime,
        )),
      );
    },
    DayListRoute.name: (routeData) {
      final args = routeData.argsAs<DayListRouteArgs>(
          orElse: () => const DayListRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: _i10.DayListPage(key: args.key)),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i11.RouteConfig(
              MainRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              RegistrationRoute.name,
              path: 'registration',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              CoreRoute.name,
              path: 'core_page',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              SecretNoteDetailRoute.name,
              path: 'secret_note_detail',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              SecretNoteListRoute.name,
              path: 'secret_note_list',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              SetDayRoute.name,
              path: 'set_day_page',
              parent: EmptyRouterRoute.name,
            ),
            _i11.RouteConfig(
              DayListRoute.name,
              path: 'day_list_page',
              parent: EmptyRouterRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i11.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.RegistrationPage]
class RegistrationRoute extends _i11.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i6.CorePage]
class CoreRoute extends _i11.PageRouteInfo<void> {
  const CoreRoute()
      : super(
          CoreRoute.name,
          path: 'core_page',
        );

  static const String name = 'CoreRoute';
}

/// generated route for
/// [_i7.SecretNoteDetailPage]
class SecretNoteDetailRoute extends _i11.PageRouteInfo<void> {
  const SecretNoteDetailRoute()
      : super(
          SecretNoteDetailRoute.name,
          path: 'secret_note_detail',
        );

  static const String name = 'SecretNoteDetailRoute';
}

/// generated route for
/// [_i8.SecretNoteListPage]
class SecretNoteListRoute extends _i11.PageRouteInfo<void> {
  const SecretNoteListRoute()
      : super(
          SecretNoteListRoute.name,
          path: 'secret_note_list',
        );

  static const String name = 'SecretNoteListRoute';
}

/// generated route for
/// [_i9.SetDayPage]
class SetDayRoute extends _i11.PageRouteInfo<SetDayRouteArgs> {
  SetDayRoute({
    _i13.Key? key,
    required bool isFirstTime,
  }) : super(
          SetDayRoute.name,
          path: 'set_day_page',
          args: SetDayRouteArgs(
            key: key,
            isFirstTime: isFirstTime,
          ),
        );

  static const String name = 'SetDayRoute';
}

class SetDayRouteArgs {
  const SetDayRouteArgs({
    this.key,
    required this.isFirstTime,
  });

  final _i13.Key? key;

  final bool isFirstTime;

  @override
  String toString() {
    return 'SetDayRouteArgs{key: $key, isFirstTime: $isFirstTime}';
  }
}

/// generated route for
/// [_i10.DayListPage]
class DayListRoute extends _i11.PageRouteInfo<DayListRouteArgs> {
  DayListRoute({_i13.Key? key})
      : super(
          DayListRoute.name,
          path: 'day_list_page',
          args: DayListRouteArgs(key: key),
        );

  static const String name = 'DayListRoute';
}

class DayListRouteArgs {
  const DayListRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'DayListRouteArgs{key: $key}';
  }
}
