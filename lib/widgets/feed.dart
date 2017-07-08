import 'package:flutter/material.dart';
import 'package:podcst_app/data/feed.dart';
import 'package:podcst_app/data/episode.dart';

class FeedWidget extends StatelessWidget {
  final Feed _feed;

  FeedWidget(this._feed);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(child: new ListView(
          children:
            _feed.episodes.map((episode) => new FeedItemWidget(episode)).toList()
        )),
      ],
    );
  }
}

class FeedItemWidget extends StatelessWidget {
  final Episode _episode;

  const FeedItemWidget(this._episode);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(),
        ]
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 32.0),
      child: new Row(
        children: <Widget>[
          new Text(
            _episode.title,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}