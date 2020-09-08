import 'package:coiffeur/dummy_data.dart';
import 'package:coiffeur/models/score.dart';
import 'package:coiffeur/widgets/main_drawer.dart';
import 'package:coiffeur/widgets/new_score.dart';
import 'package:coiffeur/widgets/score_item.dart';
import 'package:coiffeur/widgets/score_list.dart';
import 'package:coiffeur/widgets/variante_item.dart';
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
    ),
    Score(
      id: 's2',
      points: 2,
    ),
  ];

  void _addNewScore(String newId, int newPoints) {
    final newScore = Score(id: newId, points: newPoints);
    setState(() {
      _teamScores.add(newScore);
    });
  }

  void _startAddNewScore(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewScore(_addNewScore);
        });
  }

  List<Widget> _buildPortraitContent(MediaQueryData mediaQuery, AppBar appBar,
      Widget textListWidget, Widget gridWidget) {
    return [
      // Container(
      //   height: (mediaQuery.size.height -
      //           appBar.preferredSize.height -
      //           mediaQuery.padding.top) *
      //       0.3,
      // ), if you uncomment that change the * 1 to * 0.7 in the textListWidget
      Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: textListWidget,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: gridWidget,
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildLandscapeContent(MediaQueryData mediaQuery, AppBar appBar,
      Widget textListWidget, Widget gridWidget) {
    return [
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[],
      // ),
      textListWidget,
      gridWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text('Coiffeur'),
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewScore(context)),
      ],
    );

    final textListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          1,
      width: (MediaQuery.of(context).size.width) * 0.4,
      child: buildContainer(
        child: ListView(
          children: DUMMY_VARIANTES
              .map(
                (catData) => VarianteItem(
                  catData.id,
                  catData.title,
                  catData.facteur,
                ),
              )
              .toList(),
        ),
      ),
    );

    final gridWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          1,
      width: (MediaQuery.of(context).size.width -
              (MediaQuery.of(context).size.width * 0.4)) *
          1,
      child: buildContainer(child: ScoreList(_teamScores)),
    );

    return Scaffold(
      appBar: appBar,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          if (isLandscape)
            ..._buildLandscapeContent(
                mediaQuery, appBar, textListWidget, gridWidget),
          if (!isLandscape)
            ..._buildPortraitContent(
                mediaQuery, appBar, textListWidget, gridWidget),
        ],
      ),
    );
  }
}
