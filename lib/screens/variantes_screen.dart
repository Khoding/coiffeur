import 'package:coiffeur/dummy_data.dart';
import 'package:coiffeur/widgets/atout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VarianteScreen extends StatelessWidget {
  static const routeName = '/variante';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_ATOUTS
          .map(
            (catData) => AtoutItem(
              catData.id,
              catData.title,
              catData.facteur,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
