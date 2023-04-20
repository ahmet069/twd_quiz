part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class StartGame extends GameEvent {
  const StartGame();
}

class FinishGame extends GameEvent {
  const FinishGame();
}

class IncreaseTrue extends GameEvent {
  const IncreaseTrue();
}

class IncreaseFalse extends GameEvent {
  const IncreaseFalse();
}

class CheckAnswer extends GameEvent {
  const CheckAnswer();
}
