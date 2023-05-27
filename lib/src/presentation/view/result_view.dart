import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../main.dart';
import '../../config/color/app_color.dart';
import '../../config/router/app_router.dart';
import '../../core/components/Admob/my_admob_banner.dart';
import '../../core/components/Button/main_buttons.dart';
import '../bloc/game_bloc/game_bloc.dart';

class ResultView extends StatefulWidget {
  final InterstitialAd? interstitialAd;
  const ResultView({
    super.key,
    required this.interstitialAd,
  });

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  void initState() {
    widget.interstitialAd?.show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/homebg.jpg'),
          //   fit: BoxFit.cover,
          // ),
          color: AppColor.darkBlue,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MyAdmobBanner(
              bannerId: 'ca-app-pub-4086698259318942/8279003512',
              adSize: AdSize.fullBanner,
            ),
            _resultContainer(),
            const MyAdmobBanner(
              bannerId: 'ca-app-pub-4086698259318942/4339758505',
              adSize: AdSize.fullBanner,
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultContainer() {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameFinished) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 1.sw,
            height: .75.sh,
            decoration: BoxDecoration(
              // color: AppColor.transparentWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'YOUR POINT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    AnimatedCircularChart(
                      size: const Size(300, 300),

                      initialChartData: <CircularStackEntry>[
                        CircularStackEntry(
                          <CircularSegmentEntry>[
                            CircularSegmentEntry(
                              state.ttrue.toDouble() * 10,
                              Colors.green[600],
                              rankKey: 'remaining',
                            ),
                            CircularSegmentEntry(
                              state.ffalse.toDouble() * 10,
                              Colors.red[400],
                              rankKey: 'completed',
                            ),
                          ],
                          rankKey: 'progress',
                        ),
                      ],
                      holeLabel: state.point.toString(),
                      labelStyle: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      // chartType: CircularChartType.Radial,
                      duration: const Duration(seconds: 1),
                      edgeStyle: SegmentEdgeStyle.round,
                      percentageValues: true,
                    )
                  ],
                ),
                Column(
                  children: [
                    MainButton(
                      title: 'NEW QUIZ',
                      onPressed: () async {
                        await router.replace(const GameRouter());
                      },
                      backgroundColor: AppColor.transparentWhite,
                      textColor: Colors.black,
                    ),
                    MainButton(
                      title: 'HOME',
                      onPressed: () async {
                        await router.replace(const HomeRouter());
                      },
                      backgroundColor: AppColor.transparentWhite,
                      textColor: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
