import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/game_settings_provider.dart';
import 'package:wordle/widgets/wordle_letterbox.dart';
import 'package:wordle/widgets/wordle_row.dart';

class WordleGrid extends ConsumerWidget {
  const WordleGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameSettings = ref.watch(GameSettingsProvider);
    final wordsize = GameSettings.wordsize;
    final List<WordleRow> rows = List.empty(growable: true);
    for (int i = 0; i < GameSettings.attemps; i++) {
      rows.add(
        WordleRow(
          wordsize: wordsize,
        ),
      );
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rows,
      ),
    );
  }
}
