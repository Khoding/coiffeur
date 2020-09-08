import 'package:flutter/foundation.dart';

class Score {
  final String id;
  final int points;
  final String variantes;

  const Score({
    @required this.id,
    @required this.points,
    @required this.variantes,
  });
}
