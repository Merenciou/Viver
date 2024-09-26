import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  bool isVoicePlaying = true;
  bool isMusicPlaying = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isVoicePlaying)
              IconButton(
                onPressed: () {
                  setState(() {
                    isVoicePlaying = !isVoicePlaying;
                  });
                },
                icon: Icon(
                  Icons.record_voice_over_rounded,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  size: 30,
                ),
              ),
            if (!isVoicePlaying)
              IconButton(
                onPressed: () {
                  setState(() {
                    isVoicePlaying = !isVoicePlaying;
                  });
                },
                icon: Icon(
                  Icons.voice_over_off_rounded,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  size: 30,
                ),
              ),
            if (isMusicPlaying)
              IconButton(
                onPressed: () {
                  setState(() {
                    isMusicPlaying = !isMusicPlaying;
                  });
                },
                icon: Icon(
                  Icons.music_note_rounded,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  size: 30,
                ),
              ),
            if (!isMusicPlaying)
              IconButton(
                onPressed: () {
                  setState(() {
                    isMusicPlaying = !isMusicPlaying;
                  });
                },
                icon: Icon(
                  Icons.music_off_rounded,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary,
                  size: 30,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
