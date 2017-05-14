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

  final scaffoldKey = new GlobalKey<ScaffoldState>();

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

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void _handleSearch() => _showSnackBar("¯\\_(ツ)_/¯");

  @override
  Widget build(BuildContext context) {
    StatelessWidget content;
    if (_isLoading) {
      content = new Text('Loading...');
    } else {
      content = new PodcastGridWidget(_podcsts);
    }

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.search),
              onPressed: _handleSearch,
          ),
        ],
      ),
      body: new Center(
        child: content,
      ),
    );
  }
}
