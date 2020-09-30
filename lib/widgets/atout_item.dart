import 'package:coiffeur/screens/variantes_screen.dart';
import 'package:flutter/material.dart';

class AtoutItem extends StatelessWidget {
  final String id;
  final String title;
  final int facteur;

  AtoutItem(this.id, this.title, this.facteur);

  /// Les variables des Atouts
  void selectAtout(BuildContext context) {
    Navigator.of(context).pushNamed(
      VarianteScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'facteur': facteur,
      },
    );
  }

  /// Gère le design d'affichage des Atouts
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
      ),
    );
  }
}
