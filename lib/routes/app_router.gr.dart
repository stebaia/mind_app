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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

import '../ui/pages/login_page.dart' as _i3;
import '../ui/pages/main_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i3.LoginPage()),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i4.RouteConfig(
              MainRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i4.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i4.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}
