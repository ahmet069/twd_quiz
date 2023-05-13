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
    GrapRouter.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const GrapView(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
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
      final args = routeData.argsAs<ResultRouterArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ResultView(
          key: args.key,
          interstitialAd: args.interstitialAd,
        ),
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
          redirectTo: '/GrapView',
          fullMatch: true,
        ),
        RouteConfig(
          GrapRouter.name,
          path: '/GrapView',
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
/// [GrapView]
class GrapRouter extends PageRouteInfo<void> {
  const GrapRouter()
      : super(
          GrapRouter.name,
          path: '/GrapView',
        );

  static const String name = 'GrapRouter';
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
class ResultRouter extends PageRouteInfo<ResultRouterArgs> {
  ResultRouter({
    Key? key,
    required InterstitialAd? interstitialAd,
  }) : super(
          ResultRouter.name,
          path: '/ResultView',
          args: ResultRouterArgs(
            key: key,
            interstitialAd: interstitialAd,
          ),
        );

  static const String name = 'ResultRouter';
}

class ResultRouterArgs {
  const ResultRouterArgs({
    this.key,
    required this.interstitialAd,
  });

  final Key? key;

  final InterstitialAd? interstitialAd;

  @override
  String toString() {
    return 'ResultRouterArgs{key: $key, interstitialAd: $interstitialAd}';
  }
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
