import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/game_settings_provider.dart';

class WordleTitleBar extends StatelessWidget {
  const WordleTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WordAttempsToggle(),
          Text(
            "WORDLE",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          WordSizeToggle()
        ],
      ),
    );
  }
}

class WordSizeToggle extends ConsumerWidget {
  const WordSizeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameSettings = ref.watch(GameSettingsProvider);
    final GameSettingsNotifier = ref.read(GameSettingsProvider.notifier);

    void _updateWordSize() {
      var newWordSize = 5;
      if (GameSettings.wordsize == 4) {
        newWordSize = 5;
      }
      if (GameSettings.wordsize == 5) {
        newWordSize = 6;
      }
      if (GameSettings.wordsize == 6) {
        newWordSize = 4;
      }

      GameSettingsNotifier.updateWordsize(newWordSize);
    }

    return Container(
      child: OutlinedButton(
        child: Text(GameSettings.wordsize.toString()),
        onPressed: _updateWordSize,
      ),
      margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
    );
  }
}

class WordAttempsToggle extends ConsumerWidget {
  const WordAttempsToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameSettings = ref.watch(GameSettingsProvider);
    final GameSettingsNotifier = ref.read(GameSettingsProvider.notifier);

    void _updateAttemps() {
      var newAttemps = 6;
      if (GameSettings.attemps == 4) {
        newAttemps = 5;
      }
      if (GameSettings.attemps == 5) {
        newAttemps = 6;
      }
      if (GameSettings.attemps == 6) {
        newAttemps = 4;
      }

      GameSettingsNotifier.updateAttemps(newAttemps);
    }

    String text;
    switch (GameSettings.attemps) {
      case 4:
        text = "HIGH";
        break;
      case 5:
        text = "MED";
        break;
      case 6:
      default:
        text = "LOW";
        break;
    }
    return Container(
      child: OutlinedButton(
        child: Text(text),
        onPressed: _updateAttemps,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
    );
  }
}
