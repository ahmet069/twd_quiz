// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';
import '../../config/router/app_router.dart';
import '../../domain/entities/question/question.dart';
import '../bloc/game_bloc/game_bloc.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  void _checkAnswer(Question question, String answer, BuildContext context) {
    if (question.trueAnswer == answer) {
      context.read<GameBloc>().add(const IncreaseTrue());
    } else {
      context.read<GameBloc>().add(const IncreaseFalse());
    }
  }

  @override
  void initState() {
    context.read<GameBloc>().add(const StartGame());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gamebg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: _questionContainer(),
      ),
    );
  }

  Widget _questionContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      height: .6.sh,
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 48,
      width: .9.sw,
      child: ElevatedButton(
        onPressed: () async {
          if (state.currentQuestionIndex == 9) {
            _checkAnswer(item, title, context);
            context.read<GameBloc>().add(const FinishGame());
            await router.replace(const ResultRouter());
          } else {
            _checkAnswer(item, title, context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
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
