import 'package:coiffeur/dummy_data.dart';
import 'package:coiffeur/widgets/main_drawer.dart';
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
  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget textListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
      ),
      textListWidget
    ];
  }

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget textListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
      textListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text('Personal Expenses'),
      actions: <Widget>[
        //   IconButton(
        //       icon: const Icon(Icons.add),
        //       onPressed: () => _startAddNewTransaction(context)),
      ],
    );

    final textListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Coiffeur'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          if (isLandscape)
            ..._buildLandscapeContent(mediaQuery, appBar, textListWidget),
          if (!isLandscape)
            ..._buildPortraitContent(mediaQuery, appBar, textListWidget),
        ],
      ),
    );
  }
}
