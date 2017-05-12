import 'package:flutter/material.dart';

import 'package:podcst_app/widgets/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Podcst',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new HomeWidget(title: 'Podcst'),
    );
  }
}
