import 'package:coiffeur/dummy_data.dart';
import 'package:coiffeur/models/score.dart';
import 'package:coiffeur/widgets/main_drawer.dart';
import 'package:coiffeur/widgets/new_score.dart';
import 'package:coiffeur/widgets/score_item.dart';
import 'package:coiffeur/widgets/Atout_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        canvasColor: Colors.white,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/': (context) => MyHomePage(),
      },
    );
  }
}

/// Build Container
Widget buildContainer({Widget child}) {
  return Container(
    child: child,
  );
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Score> _teamScores = [
    Score(
      id: 's1',
      points: 1,
      facteurTemporel: 1,
    ),
    Score(
      id: 's2',
      points: 2,
      facteurTemporel: 2,
    ),
  ];

  /// Ajouter un nouveau score
  void _addNewScore(String newId, int newPoints, int newFacteurTemporel) {
    final newScore = Score(
      id: newId,
      points: newPoints,
      facteurTemporel: newFacteurTemporel,
    );
    setState(() {
      _teamScores.add(newScore);
    });
  }

  /// Ajouter un nouveau Score
  void _startAddNewScore(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewScore(_addNewScore);
      },
    );
  }

  /// Fini mais peut être amélioré
  List<Widget> _buildPortraitContent(MediaQueryData mediaQuery, AppBar appBar,
      Widget textListWidget, Widget dataWidget) {
    return [
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Atouts',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Equipe 1',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Equipe 2',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [textListWidget, dataWidget, dataWidget],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: appBar.preferredSize.height,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Score',
                    ),
                    Text(
                      'Score',
                    ),
                    Text(
                      'Score',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  /// Pas fini
  List<Widget> _buildLandscapeContent(MediaQueryData mediaQuery, AppBar appBar,
      Widget textListWidget, Widget dataWidget) {
    return [
      textListWidget,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text('Coiffeur'),
    );

    /// Il s'occupe d'afficher les Atouts
    final textListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              (appBar.preferredSize.height * 3) -
              MediaQuery.of(context).padding.top) *
          1,
      width: (MediaQuery.of(context).size.width) * 0.4,
      child: buildContainer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: DUMMY_ATOUTS
              .map(
                (catData) => AtoutItem(
                  catData.id,
                  catData.title,
                  catData.facteur,
                ),
              )
              .toList(),
        ),
      ),
    );

    /// Il s'occupe d'afficher les Scores
    final dataWidget = Container(
      height: (MediaQuery.of(context).size.height -
              (appBar.preferredSize.height * 3) -
              MediaQuery.of(context).padding.top) *
          1,
      width: (MediaQuery.of(context).size.width) * 0.275,
      child: buildContainer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: DUMMY_SCORES
              .map(
                (catData) => ScoreItem(
                    catData.id, catData.points * catData.facteurTemporel),
              )
              .toList(),
        ),
      ),
    );

    /// Il crée tout en se basant sur la position du téléphone (Landscape pas fonctionnel)
    return Scaffold(
      appBar: appBar,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          if (isLandscape)
            ..._buildLandscapeContent(
                mediaQuery, appBar, textListWidget, dataWidget),
          if (!isLandscape)
            ..._buildPortraitContent(
                mediaQuery, appBar, textListWidget, dataWidget),
        ],
      ),
    );
  }
}
