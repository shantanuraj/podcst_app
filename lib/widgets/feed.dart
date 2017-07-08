import 'package:flutter/material.dart';
import 'package:podcst_app/data/feed.dart';
import 'package:podcst_app/data/episode.dart';

class FeedWidget extends StatelessWidget {
  final Feed _feed;

  FeedWidget(this._feed);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.black54,
      ),
      child: new Column(
        children: <Widget>[
          new Expanded(
              child: new ListView(
                children: ListTile
                    .divideTiles(
                  context: context,
                  color: Colors.white70,
                  tiles: _feed.episodes
                      .map((episode) => new FeedItemWidget(episode)),
                )
                    .toList(),
              )),
        ],
      ),
    );
  }
}

class FeedItemWidget extends StatelessWidget {
  final Episode _episode;

  const FeedItemWidget(this._episode);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListTile(
        title: new Text(
          _episode.title,
        ),
      ),
    );
  }
}
