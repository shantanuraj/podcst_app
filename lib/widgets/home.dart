import 'package:flutter/material.dart';

import 'package:podcst_app/widgets/podcast.dart';

import 'package:podcst_app/data/api.dart';
import 'package:podcst_app/data/podcst.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeWidgetState createState() => new _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool _isLoading = true;
  List<Podcst> _podcsts;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    PodcstApi.getFeatured().then(onPodcstsLoaded);
  }

  onPodcstsLoaded(List<Podcst> podcsts) {
    setState(() {
      _isLoading = false;
      _podcsts = podcsts;
    });
  }

  @override
  Widget build(BuildContext context) {

    var content;
    if (_isLoading) {
      content = new Text('Loading...');
    } else {
      content = new ListView(
        children: _podcsts.map((podcst) => new PodcastWidget(podcst)).toList()
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: content,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}