import 'package:flutter/material.dart';
import 'package:podcst_app/data/podcst.dart';

class PodcastGridWidget extends StatelessWidget {

  final List<Podcst> _podcsts;

  PodcastGridWidget(this._podcsts);

  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: this._podcsts
            .map((podcst) => new PodcastWidget(podcst))
            .toList()
    );
  }
}

class PodcastWidget extends StatelessWidget {

  final Podcst _podcst;

  PodcastWidget(this._podcst);

  onTap(BuildContext context) {
    var sb = new SnackBar(
        content: new Text(_podcst.title),
        backgroundColor: Colors.teal,
    );
    Scaffold.of(context).showSnackBar(sb);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(_podcst.title),
      subtitle: new Text(_podcst.author),
      leading: new Image.network(_podcst.thumbnail),
      onTap: () => onTap(context),
    );
  }
}