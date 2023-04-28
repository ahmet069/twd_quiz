import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'src/config/router/app_router.dart';
import 'src/injector.dart' as di;
import 'src/presentation/bloc/game_bloc/game_bloc.dart';

void main() async {
  await _initalize();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

Future<void> _initalize() async {
  await di.init();
}

final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.injector<GameBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
