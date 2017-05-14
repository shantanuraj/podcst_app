import 'package:flutter/material.dart';
import 'package:podcst_app/data/api.dart';
import 'package:podcst_app/data/podcst.dart';
import 'package:podcst_app/widgets/podcasts_grid.dart';

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

  void onPodcstsLoaded(List<Podcst> podcsts) {
    setState(() {
      _isLoading = false;
      _podcsts = podcsts;
    });
  }

  @override
  Widget build(BuildContext context) {

    StatelessWidget content;
    if (_isLoading) {
      content = new Text('Loading...');
    } else {
      content = new PodcastGridWidget(_podcsts);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: content,
      ),
    );
  }
}
