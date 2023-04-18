// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResultRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ResultView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GameRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const GameView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/HomeView',
          fullMatch: true,
        ),
        RouteConfig(
          HomeRouter.name,
          path: '/HomeView',
        ),
        RouteConfig(
          ResultRouter.name,
          path: '/ResultView',
        ),
        RouteConfig(
          GameRouter.name,
          path: '/GameView',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/HomeView',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [ResultView]
class ResultRouter extends PageRouteInfo<void> {
  const ResultRouter()
      : super(
          ResultRouter.name,
          path: '/ResultView',
        );

  static const String name = 'ResultRouter';
}

/// generated route for
/// [GameView]
class GameRouter extends PageRouteInfo<void> {
  const GameRouter()
      : super(
          GameRouter.name,
          path: '/GameView',
        );

  static const String name = 'GameRouter';
}
