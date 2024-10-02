import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class HomeAppController with ChangeNotifier {
  final player = AudioPlayer();
  dynamic stateMusicPlayer;

  Future<void> playMusic() async {
    player.setVolume(1);
    stateMusicPlayer = player.play(AssetSource('ambience.mp3'));
    notifyListeners();
  }

  Future<void> stopMusic() async {
    stateMusicPlayer = player.stop();
    notifyListeners();
  }

  Future<void> muteMusic() async {
    stateMusicPlayer = player.setVolume(0);
    notifyListeners();
  }

  Future<void> listenMusic() async {
    stateMusicPlayer = player.setVolume(1);
    notifyListeners();
  }
}
