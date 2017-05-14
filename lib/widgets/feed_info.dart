import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:podcst_app/data/api.dart';
import 'package:podcst_app/data/feed.dart';
import 'package:podcst_app/data/podcst.dart';

class FeedInfo extends StatefulWidget {
  FeedInfo({Key key, this.podcst}) : super(key: key);

  final Podcst podcst;

  @override
  _FeedInfoState createState() => new _FeedInfoState(podcst);
}

class _FeedInfoState extends State<FeedInfo> {
  final Podcst _podcst;

  bool _isLoading;
  Feed _feed;

  _FeedInfoState(this._podcst);

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    PodcstApi.getFeed(_podcst.feed).then(onFeedLoaded);
  }

  void onFeedLoaded(Feed feed) {
    setState(() {
      _isLoading = false;
      _feed = feed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        _isLoading ?
        new Image.network(_podcst.cover, fit: BoxFit.cover) :
        new Row(
          children: [
            new Image.network(
              _feed.cover,
              fit: BoxFit.cover,
              width: 410.0,
            ),
          ],
        ),
      ],
    );
  }
}
