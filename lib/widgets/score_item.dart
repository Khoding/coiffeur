import 'package:coiffeur/screens/variantes_screen.dart';
import 'package:flutter/material.dart';

class ScoreItem extends StatefulWidget {
  const ScoreItem({
    Key key,
    @required this.scores,
  }) : super(key: key);

  final int scores;

  @override
  _ScoreItemState createState() => _ScoreItemState();
}

class _ScoreItemState extends State<ScoreItem> {
  void selectVariante(BuildContext context) {
    Navigator.of(context).pushNamed(
      VarianteScreen.routeName,
      arguments: {
        'points': widget.scores,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectVariante(context),
      splashColor: Theme.of(context).primaryColor,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Team 1')),
          DataColumn(label: Text('Team 2'))
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(ScoreItem(scores: widget.scores)),
            ],
          ),
        ],
      ),
    );
  }
}
