import 'package:flutter/material.dart';

import 'package:podcst_app/widgets/home.dart';

void main() {
  runApp(new PodcstApp());
}

class PodcstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Podcst',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
      ),
      home: new HomeWidget(title: 'Podcst'),
    );
  }
}
