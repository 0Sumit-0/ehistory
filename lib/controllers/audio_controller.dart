import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  AudioPlayer _audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxDouble playbackTime = 0.0.obs;
  RxDouble totalDuration = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer.onPositionChanged.listen((Duration duration) {
      playbackTime.value = duration.inSeconds.toDouble();
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      totalDuration.value = duration.inSeconds.toDouble();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      isPlaying.value = false;
      playbackTime.value = 0.0;
    });

    _audioPlayer.onSeekComplete.listen((event) {

    });
  }

  void playPause(String audioUrl) {
    if (isPlaying.value) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(AssetSource(audioUrl));
    }
    isPlaying.toggle();
  }

  void stop() {
    _audioPlayer.stop();
    isPlaying.value = false;
    playbackTime.value = 0.0;
  }

  void seek(double seconds) {
    _audioPlayer.seek(Duration(seconds: seconds.toInt()));
  }

  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
