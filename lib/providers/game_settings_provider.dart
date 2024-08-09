import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameSettings {
  final int wordsize;
  final int attemps;

  GameSettings({required this.wordsize, required this.attemps});

  GameSettings clone({int? wordsize, int? attemps}) {
    return GameSettings(
      attemps: attemps ?? this.attemps,
      wordsize: wordsize ?? this.wordsize,
    );
  }
}

class GameSettingsNotifier extends StateNotifier<GameSettings> {
  GameSettingsNotifier() : super(GameSettings(wordsize: 5, attemps: 6));

  void updateAttemps(int attemps) {
    state = state.clone(attemps: attemps);
  }

  void updateWordsize(int wordsize) {
    state = state.clone(wordsize: wordsize);
  }
}

final GameSettingsProvider =
    StateNotifierProvider<GameSettingsNotifier, GameSettings>((ref) {
  return GameSettingsNotifier();
});
