// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../main.dart';
import '../../config/router/app_router.dart';
import '../../core/components/Admob/my_admob_banner.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/question/question.dart';
import '../bloc/game_bloc/game_bloc.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

InterstitialAd? interstitialAd;
//* interstitial
void _createInterstitialAd() {
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
    _createInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _actionButtonExit(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: Container(
        padding: const EdgeInsets.only(top: 75),
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gamebg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _questionContainer(),
              const MyAdmobBanner(
                bannerId: 'ca-app-pub-4086698259318942/8795258277',
                adSize: AdSize.largeBanner,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButtonExit() {
    return SizedBox(
      width: 66,
      height: 66,
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
          width: 32,
        ),
      ),
    );
  }

  Widget _questionContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      height: .7.sh,
      width: 1.sw - 20,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          //? GAME STARTED
          if (state is GameStarted) {
            final item = state.data[state.currentQuestionIndex];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon/question_mark.svg',
                          height: 20,
                          color: const Color(0xff404040),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${state.currentQuestionIndex + 1} / 10',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon/point.svg',
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(state.point.toString()),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        item.question.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        _option(item.options![0], state, context),
                        _option(item.options![1], state, context),
                        _option(item.options![2], state, context),
                        _option(item.options![3], state, context),
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

  Widget _option(String title, GameStarted state, BuildContext context) {
    final item = state.data[state.currentQuestionIndex];
    print(state.currentAnswer.length);
    // final Color answeredOptionColor = item.trueAnswer == title
    //     ? state.currentAnswer.length > 0
    //         ? Colors.green
    //         : Colors.transparent
    //     : state.currentAnswer == title
    //         ? Colors.red
    //         : Colors.transparent;
    final Color answeredOptionColor = state.currentAnswer.length > 0
        ? item.trueAnswer == title
            ? Colors.green
            : Colors.transparent
        : Colors.transparent;
    // if (state.currentAnswer.length > 0) {
    //   Color optionColor = answeredOptionColor;
    // }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 48,
      width: .9.sw,
      child: ElevatedButton(
        onPressed: () async {
          context.read<GameBloc>().add(AnswerQuestion(answer: title));
          if (state.currentQuestionIndex == 9) {
            await _checkAnswer(item, title, context);
            context.read<GameBloc>().add(const FinishGame());
            await router.replace(ResultRouter(interstitialAd: interstitialAd));
          } else {
            await _checkAnswer(item, title, context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: answeredOptionColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
