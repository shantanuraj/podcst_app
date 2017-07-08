import 'package:flutter/material.dart';
import 'package:podcst_app/data/feed.dart';
import 'package:podcst_app/data/episode.dart';

const Color _kKeyUmbraOpacity = const Color(0x33000000); // alpha = 0.2
const Color _kKeyPenumbraOpacity = const Color(0x24000000); // alpha = 0.14
const Color _kAmbientShadowOpacity = const Color(0x1F000000); // alpha = 0.12

class FeedWidget extends StatelessWidget {
  final Feed _feed;

  FeedWidget(this._feed);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.black54,
        boxShadow: const <BoxShadow>[
          const BoxShadow(offset: const Offset(0.0, 3.0), blurRadius: 1.0, spreadRadius: -2.0, color: _kKeyUmbraOpacity),
          const BoxShadow(offset: const Offset(0.0, 2.0), blurRadius: 2.0, spreadRadius: 0.0, color: _kKeyPenumbraOpacity),
          const BoxShadow(offset: const Offset(0.0, 1.0), blurRadius: 5.0, spreadRadius: 0.0, color: _kAmbientShadowOpacity),
        ],
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
