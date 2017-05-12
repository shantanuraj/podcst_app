import 'package:flutter/material.dart';
import 'package:podcst_app/data/podcst.dart';

class PodcastWidget extends StatelessWidget {

  final Podcst _podcst;

  PodcastWidget(this._podcst);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(_podcst.title),
      subtitle: new Text(_podcst.author),
      leading: new Image.network(_podcst.thumbnail),
    );
  }
}