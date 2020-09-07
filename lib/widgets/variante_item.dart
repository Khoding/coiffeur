import 'package:coiffeur/screens/variantes_screen.dart';
import 'package:flutter/material.dart';

class VarianteItem extends StatelessWidget {
  final String id;
  final String title;
  final int facteur;

  VarianteItem(this.id, this.title, this.facteur);

  void selectVariante(BuildContext context) {
    Navigator.of(context).pushNamed(
      VarianteScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'facteur': facteur,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectVariante(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
