import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:podcst_app/data/api.dart';
import 'package:podcst_app/data/feed.dart';
import 'package:podcst_app/data/podcst.dart';

class FeedWrapper extends StatefulWidget {
  FeedWrapper({Key key, this.podcst}) : super(key: key);

  final Podcst podcst;

  @override
  _FeedWrapperState createState() => new _FeedWrapperState(podcst);
}

class _FeedWrapperState extends State<FeedWrapper> {
  final Podcst _podcst;

  bool _isLoading;
  Feed _feed;

  _FeedWrapperState(this._podcst);

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
        _isLoading
            ? new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Text('Loading...'),
        )
            : new FeedInfo(_feed),
      ],
    );
  }
}

class FeedInfo extends StatelessWidget {
  final Feed _feed;

  FeedInfo(this._feed);

  @override
  Widget build(BuildContext context) {
    return new Row(
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
