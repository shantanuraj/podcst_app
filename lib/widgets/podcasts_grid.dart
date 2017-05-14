import 'package:flutter/material.dart';
import 'package:podcst_app/data/podcst.dart';
import 'package:podcst_app/widgets/feed_info.dart';

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

  void onTap(BuildContext context) {
    Scaffold.of(context)
        .showBottomSheet<FeedWrapper>((context) => new FeedWrapper(url: _podcst.feed));
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
