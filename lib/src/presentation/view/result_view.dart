import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../../config/color/app_color.dart';
import '../../config/router/app_router.dart';
import '../../core/components/Button/main_buttons.dart';
import '../bloc/game_bloc/game_bloc.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/homebg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameFinished) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 1.sw,
                height: .75.sh,
                decoration: BoxDecoration(
                  color: AppColor.transparentWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'YOUR POINT: ${state.point}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(10),
                        //   width: .65.sw,
                        //   height: .65.sw,
                        //   decoration: BoxDecoration(
                        //     color: Colors.deepOrangeAccent,
                        //     borderRadius: BorderRadius.circular(200),
                        //   ),
                        //   alignment: Alignment.center,
                        //   margin: const EdgeInsets.symmetric(vertical: 20),
                        //   child: Text(
                        //     state.point.toString(),
                        //     style: const TextStyle(
                        //       fontSize: 80,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        AnimatedCircularChart(
                          size: const Size(300, 300),
                          initialChartData: <CircularStackEntry>[
                            CircularStackEntry(
                              <CircularSegmentEntry>[
                                CircularSegmentEntry(
                                  state.ttrue.toDouble() * 10,
                                  Colors.green[400],
                                  rankKey: 'completed',
                                ),
                                CircularSegmentEntry(
                                  state.ffalse.toDouble() * 10,
                                  Colors.red[600],
                                  rankKey: 'remaining',
                                ),
                              ],
                              rankKey: 'progress',
                            ),
                          ],
                          holeLabel: state.point.toString(),
                          labelStyle: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          // chartType: CircularChartType.Radial,
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
                          title: 'HOME SCREEN',
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
            }
            return Container();
            // return Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 10),
            //   width: 1.sw,
            //   height: .75.sh,
            //   decoration: BoxDecoration(
            //     color: AppColor.transparentWhite,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
