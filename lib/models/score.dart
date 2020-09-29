import 'package:flutter/foundation.dart';

class Score {
  final String id;
  final int points;
  final int facteurTemporel;

  const Score({
    @required this.id,
    @required this.points,
    this.facteurTemporel,
  });
}
