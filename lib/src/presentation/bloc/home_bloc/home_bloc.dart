import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<StartMusic>((event, emit) async {
      // await AssetsAudioPlayer.newPlayer().open(
      //   Audio('assets/audios/music.mp3'),
      //   autoStart: true,
      //   showNotification: true,
      // );
      audioPlayer.open(
        Audio('assets/audios/music.mp3'),
      );
    });
    on<StopMusic>((event, emit) async {
      audioPlayer.stop();
    });
  }
}
