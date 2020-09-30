import 'package:flutter/material.dart';

import 'score_item.dart';
import 'package:coiffeur/models/score.dart';

class ScoreList extends StatelessWidget {
  final List<Score> scores;

  ScoreList(this.scores);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return ListView(
      children: scores
          .map(
            (tx) => ScoreItem(
              tx.id,
              tx.points,
            ),
          )
          .toList(),
    );
  }
}
