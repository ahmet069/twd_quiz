import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../presentation/view/game_view.dart';
import '../../presentation/view/home_view.dart';
import '../../presentation/view/result_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  // * for names
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    CustomRoute(
      initial: true,
      page: HomeView,
      path: '/HomeView',
      name: 'HomeRouter',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: ResultView,
      name: 'ResultRouter',
      path: '/ResultView',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: GameView,
      name: 'GameRouter',
      path: '/GameView',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    )
  ],
)
class AppRouter extends _$AppRouter {}
