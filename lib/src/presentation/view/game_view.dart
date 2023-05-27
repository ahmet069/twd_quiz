// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../main.dart';
import '../../config/color/app_color.dart';
import '../../config/router/app_router.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/question/question.dart';
import '../bloc/game_bloc/game_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

InterstitialAd? interstitialAd;
//* interstitial
Future<void> _createInterstitialAd() async {
  InterstitialAd.load(
    adUnitId: kDebugMode
        ? 'ca-app-pub-3940256099942544/8691691433' // test id
        : 'ca-app-pub-4086698259318942/6450583384', // release id
    request: const AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (ad) {
        interstitialAd = ad;
        if (kDebugMode) {
          print('intersititial succes');
        }
        // interstitialAd!.show();
      },
      onAdFailedToLoad: (LoadAdError error) {
        if (kDebugMode) {
          print('intersititial failed');
        }
      },
    ),
  );
}

Color trueBackground = Colors.transparent;

class _GameViewState extends State<GameView> {
  Future<void> _checkAnswer(Question question, String answer, BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (question.trueAnswer == answer) {
      trueBackground = Colors.green;
    } else {}
    if (question.trueAnswer == answer) {
      context.read<GameBloc>().add(const IncreaseTrue());
    } else {
      context.read<GameBloc>().add(const IncreaseFalse());
    }
  }

  @override
  void initState() {
    context.read<GameBloc>().add(const StartGame());
    context.read<HomeBloc>().add(const StopMusic());
    _createInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _actionButtonExit(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Container(
        padding: const EdgeInsets.only(top: 75),
        width: 1.sw,
        height: 1.sh,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/homebg2.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        decoration: BoxDecoration(
          color: AppColor.lightBlue,
        ),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _questionContainer(),
              //* reklan deactived
              // const MyAdmobBanner(
              //   bannerId: 'ca-app-pub-4086698259318942/8795258277',
              //   adSize: AdSize.fullBanner,
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButtonExit() {
    return SizedBox(
      width: 55,
      height: 55,
      child: FloatingActionButton(
        onPressed: () async {
          // await router.replace(const HomeRouter());
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('NO'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop(true);
                      await router.replace(const HomeRouter());
                    },
                    child: const Text('YES'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.red,
        child: SvgPicture.asset(
          ApplicationConstants.exit,
          color: Colors.white,
          width: 28,
        ),
      ),
    );
  }

  Widget _questionContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      height: .7.sh,
      width: 1.sw - 20,
      decoration: BoxDecoration(
        color: AppColor.darkBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          //? GAME STARTED
          if (state is GameLoading) {
            return SizedBox(
              width: .05.sw,
              height: .05.sw,
              child: const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.red,
                strokeWidth: 7.0,
              ),
            );
          } else if (state is GameStarted) {
            final item = state.data[state.currentQuestionIndex];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 5),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/question_mark.svg',
                              height: 24,
                              color: const Color(0xff404040),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${state.currentQuestionIndex + 1} / 10',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(child: _actionButtonExit()),

                      Container(
                        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 8),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon/point.svg',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              state.point.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        item.question.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          // wordSpacing: 3,

                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        _option(item.options![0], 'A', state, context),
                        _option(item.options![1], 'B', state, context),
                        _option(item.options![2], 'C', state, context),
                        _option(item.options![3], 'D', state, context),
                      ],
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _option(String title, String word, GameStarted state, BuildContext context) {
    final item = state.data[state.currentQuestionIndex];
    final Color answeredOptionColor = state.currentAnswer.isNotEmpty
        ? item.trueAnswer == title
            ? Colors.green
            : title == state.currentAnswer
                ? Colors.red
                : Colors.white
        : Colors.white;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      // padding: const EdgeInsets.symmetric(horizontal: 2),
      height: 60,
      width: .87.sw,
      child: ElevatedButton(
        onPressed: () async {
          if (state.currentAnswer.isNotEmpty) {
          } else {
            context.read<GameBloc>().add(AnswerQuestion(answer: title));
            if (state.currentQuestionIndex == 9) {
              await _checkAnswer(item, title, context);
              context.read<GameBloc>().add(const FinishGame());
              await router.replace(ResultRouter(interstitialAd: interstitialAd));
            } else {
              await _checkAnswer(item, title, context);
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: answeredOptionColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 50,
            //   height: 50,
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //     color: AppColor.lightBlue,
            //     borderRadius: BorderRadius.circular(50),
            //   ),
            //   child: Text(
            //     word,
            //     style: const TextStyle(
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            Container(
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
