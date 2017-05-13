import 'package:flutter/material.dart';
import 'package:podcst_app/data/api.dart';
import 'package:podcst_app/data/feed.dart';
import 'package:flutter/painting.dart';

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
    return new Row(
      children: [
        _isLoading ?
          new Padding(
            padding: const EdgeInsets.all(32.0),
            child: new Text('Loading...'),
          ) :
          new FeedInfo(_feed),
      ],
    );
  }
}

class FeedInfo extends StatelessWidget {
  final Feed _feed;

  FeedInfo(this._feed);

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Image.network(
          _feed.cover,
          fit: BoxFit.cover,
          width: 410.0,
        ),
      ],
    );
  }
}