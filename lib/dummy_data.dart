import 'dart:math';

import 'models/variante.dart';
import 'models/score.dart';

const DUMMY_VARIANTES = const [
  Variante(
    id: 'v1',
    title: 'Cœur',
    facteur: 1,
  ),
  Variante(
    id: 'v2',
    title: 'Trèfle',
    facteur: 2,
  ),
  Variante(
    id: 'v3',
    title: 'Carreau',
    facteur: 3,
  ),
  Variante(
    id: 'v4',
    title: 'Pique',
    facteur: 4,
  ),
  Variante(
    id: 'v5',
    title: 'Misère',
    facteur: 5,
  ),
  Variante(
    id: 'v6',
    title: '6 X',
    facteur: 6,
  ),
  Variante(
    id: 'v7',
    title: 'Par le Bas',
    facteur: 7,
  ),
  Variante(
    id: 'v8',
    title: 'Par le Haut',
    facteur: 8,
  ),
  Variante(
    id: 'v9',
    title: 'Slalom',
    facteur: 9,
  ),
  Variante(
    id: 'v10',
    title: '10 X',
    facteur: 10,
  ),
];

const DUMMY_SCORES = const [
  Score(
    id: 's1',
    points: 23,
    facteurTemporel: 1,
  ),
  Score(
    id: 's2',
    points: 4,
    facteurTemporel: 2,
  ),
  Score(
    id: 's3',
    points: 52,
    facteurTemporel: 3,
  ),
  Score(
    id: 's4',
    points: 32,
    facteurTemporel: 4,
  ),
  Score(
    id: 's5',
    points: 58,
    facteurTemporel: 5,
  ),
  Score(
    id: 's6',
    points: 86,
    facteurTemporel: 6,
  ),
  Score(
    id: 's7',
    points: 102,
    facteurTemporel: 7,
  ),
  Score(
    id: 's8',
    points: 23,
    facteurTemporel: 8,
  ),
  Score(
    id: 's9',
    points: 13,
    facteurTemporel: 9,
  ),
  Score(
    id: 's10',
    points: 2,
    facteurTemporel: 10,
  ),
];
