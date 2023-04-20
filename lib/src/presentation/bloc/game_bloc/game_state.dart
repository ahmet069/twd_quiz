part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}

class GameStarted extends GameState {
  final int ttrue;
  final int ffalse;
  final int currentQuestionIndex;
  final int point;
  final List<Question> data;

  const GameStarted({
    required this.ttrue,
    required this.currentQuestionIndex,
    required this.ffalse,
    required this.point,
    required this.data,
  });

  @override
  List<Object> get props => [ttrue, currentQuestionIndex, ffalse];
}

class GameFinished extends GameState {
  final int ttrue;
  final int ffalse;
  final int currentQuestionIndex;
  final int point;

  const GameFinished({
    required this.ttrue,
    required this.ffalse,
    required this.currentQuestionIndex,
    required this.point,
  });
}
