import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'i18n/i18n.dart';

void main() => runApp(MyApp());

// Flappy doesn't support country. meh
final supportedLocales = [
  const Locale('en', ''),
  const Locale('es', ''),
  const Locale('fr', ''),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Swap locale at runtime
  int localIndex = 0;
  void _swapLanguage() {
    setState(() {
      localIndex = localIndex >= supportedLocales.length - 1 ? 0 : localIndex + 1;
      I18n.load(supportedLocales[localIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(I18n.of(context).title),
            Text(I18n.of(context).hello),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _swapLanguage,
        child: Icon(Icons.add),
      ),
    );
  }
}
