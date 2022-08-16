/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:quran_flutter_app/src/providers/audio_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/ui/screens/surah_screen/widgets/custom_icon_button.dart';

class PlayButton extends StatefulWidget {
  final int index;
  final String url;

  const PlayButton({
    Key? key,
    required this.index,
    required this.url,
  }) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  Widget build(BuildContext context) {
    var playerProvider = context.watch<AudioPlayerProvider>();
    return CustomIconButton(
      icon: (() {
        if (playerProvider.index == widget.index &&
            playerProvider.isPlaying &&
            playerProvider.url == widget.url) {
          return const Icon(
            Icons.pause_circle_outline,
          );
        } else {
          return const Icon(
            Icons.play_circle_outline,
          );
        }
      })(),
      size: 25,
      onPressed: () {
        if (playerProvider.isPlaying) {
          if (playerProvider.url == widget.url) {
            playerProvider.stopAudio();
          } else {
            playerProvider.stopAudio();
            playerProvider.index = widget.index;
            playerProvider.playAudio(widget.url);
          }
        } else {
          playerProvider.index = widget.index;
          playerProvider.playAudio(widget.url);
        }
      },
    );
  }
}
