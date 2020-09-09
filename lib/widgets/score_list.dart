import 'package:flutter/material.dart';

import 'score_item.dart';
import '../models/score.dart';

class ScoreList extends StatelessWidget {
  final List<Score> scores;

  ScoreList(this.scores);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return ListView(
      children: scores
          .map((tx) => ScoreItem(
                key: ValueKey(tx.id),
                scores: tx.points,
              ))
          .toList(),
    );
  }
}