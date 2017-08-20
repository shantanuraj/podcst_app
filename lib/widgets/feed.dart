import 'package:flutter/material.dart';

import 'package:podcst_app/data/feed.dart';
import 'package:podcst_app/data/episode.dart';
import 'package:podcst_app/utils/audio.dart';

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
                      .map((episode) => new FeedItemWidget(
                        episode,
                        new Audio(episode.file.url)
                      )),
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
  final Audio _player;

  const FeedItemWidget(this._episode, this._player);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListTile(
        title: new Text(
          _episode.title,
        ),
        trailing:new IconButton(
            icon: new Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 32.0,
            ),
            onPressed: () => _player.play()
        ),
      ),
    );
  }
}
