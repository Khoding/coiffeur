import 'package:coiffeur/screens/variantes_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// Random pour afficher des scores différents
rnd() {
  var rng = new Random();
  int rnd = rng.nextInt(10) + 1;
  return rnd;
}

class ScoreItem extends StatelessWidget {
  final String id;
  final int scores;

  ScoreItem(this.id, this.scores);

  void selectScore(BuildContext context) {
    Navigator.of(context).pushNamed(
      VarianteScreen.routeName,
      arguments: {
        'id': id,
        'scores': scores,
      },
    );
  }

  void selectVariante(BuildContext context) {
    Navigator.of(context).pushNamed(
      VarianteScreen.routeName,
      arguments: {
        'points': scores,
      },
    );
  }

  /// Gère le style d'affichage des scores
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Text('${scores * rnd()}'),
    );
  }
}
