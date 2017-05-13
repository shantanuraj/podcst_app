import 'package:flutter/material.dart';
import 'package:podcst_app/data/api.dart';
import 'package:podcst_app/data/feed.dart';

class FeedWrapper extends StatefulWidget {
  FeedWrapper({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _FeedWrapperState createState() => new _FeedWrapperState(url);
}

class _FeedWrapperState extends State<FeedWrapper> {

  final String url;

  bool _isLoading;
  Feed _feed;

  _FeedWrapperState(this.url);

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    PodcstApi.getFeed(url)
        .then(onFeedLoaded);
  }

  onFeedLoaded(Feed feed) {
    setState(() {
      _isLoading = false;
      _feed = feed;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return new Text("Loading...");
    } else {
      return new FeedInfo(_feed);
    }
  }
}

class FeedInfo extends StatelessWidget {
  final Feed _feed;

  FeedInfo(this._feed);

  @override
  Widget build(BuildContext context) {
    return new Text(_feed.episodes.length.toString());
  }
}