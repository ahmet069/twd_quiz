import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';

import '../../../domain/entities/question/question.dart';
import '../../../domain/usecase/question_usecase.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final QuestionUsecase _usecase;
  final _seed = Random.secure();
  late int point;
  late int ttrue;
  late int ffalse;
  late int currentQuestionIndex;
  var dataList = <Question>[];
  late String currentAnswer = '';

  GameBloc(this._usecase) : super(GameInitial()) {
    on<StartGame>(
      (event, emit) async {
        emit(const GameLoading());
        point = 0;
        ttrue = 0;
        ffalse = 0;
        currentQuestionIndex = 0;
        dataList = await _usecase.getAllQuestions();
        dataList.shuffle(_seed);
        currentAnswer = '';
        await Future.delayed(const Duration(milliseconds: 1500));
        emit(
          GameStarted(
              ttrue: ttrue,
              currentQuestionIndex: currentQuestionIndex,
              ffalse: ffalse,
              point: point,
              data: dataList,
              currentAnswer: currentAnswer),
        );
      },
    );
    on<FinishGame>((event, emit) {
      // currentQuestion = 0;
      // point = 0;
      // ttrue = 0;
      // ffalse = 0;
      currentAnswer = '';
      emit(GameFinished(
        currentQuestionIndex: currentQuestionIndex,
        ffalse: ffalse,
        ttrue: ttrue,
        point: point,
        currentAnswer: currentAnswer,
      ));
    });
    on<IncreaseFalse>((event, emit) {
      ffalse++;
      currentQuestionIndex++;
      point = point - 5;
      currentAnswer = '';

      emit(GameStarted(
        ttrue: ttrue,
        currentQuestionIndex: currentQuestionIndex,
        ffalse: ffalse,
        point: point,
        data: dataList,
        currentAnswer: currentAnswer,
      ));
    });
    on<IncreaseTrue>((event, emit) {
      ttrue++;
      currentQuestionIndex++;
      point = point + 10;
      currentAnswer = '';
      emit(GameStarted(
        ttrue: ttrue,
        currentQuestionIndex: currentQuestionIndex,
        ffalse: ffalse,
        point: point,
        data: dataList,
        currentAnswer: currentAnswer,
      ));
    });
    on<AnswerQuestion>((event, emit) async {
      currentAnswer = event.answer;
      // await AssetsAudioPlayer.newPlayer().open(
      //   Audio('assets/audios/blood.mp3'),
      //   volume: -5,
      //   showNotification: true,
      // );
      emit(GameStarted(
        ttrue: ttrue,
        currentQuestionIndex: currentQuestionIndex,
        ffalse: ffalse,
        point: point,
        data: dataList,
        currentAnswer: currentAnswer,
      ));
    });
    on<StartVoiceEffect>((event, emit) async {
      await AssetsAudioPlayer.newPlayer().open(
        Audio('assets/audios/zombie_roar.mp3'),
        showNotification: true,
      );
    });
  }
}
