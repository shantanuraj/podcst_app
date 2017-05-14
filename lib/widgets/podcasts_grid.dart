import 'package:flutter/material.dart';
import 'package:podcst_app/data/podcst.dart';
import 'package:podcst_app/widgets/feed_info.dart';

class PodcastGridWidget extends StatelessWidget {
  final List<Podcst> _podcsts;

  PodcastGridWidget(this._podcsts);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery
        .of(context)
        .orientation;

    return new Column(
      children: <Widget>[
        new Expanded(
            child: new GridView.count(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
              childAspectRatio: (orientation == Orientation.portrait)
                  ? 1.0
                  : 1.3,
              children: _podcsts.map((podcst) => new PodcastWidget(podcst))
                  .toList(),
            )
        ),
      ],
    );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return new FittedBox(
      fit: BoxFit.scaleDown,
      alignment: FractionalOffset.centerLeft,
      child: new Text(text),
    );
  }
}

class PodcastWidget extends StatelessWidget {
  final Podcst _podcst;

  const PodcastWidget(this._podcst);

  @override
  Widget build(BuildContext context) {

    final Widget image = new GestureDetector(
      onTap: () => print(_podcst.title),
      child: new Hero(
          key: new Key(_podcst.title),
          tag: _podcst.title,
          child: new Image.network(_podcst.thumbnail, fit: BoxFit.cover),
      ),
    );

    return new GridTile(
        child: image,
        footer: new GridTileBar(
          backgroundColor: Colors.black45,
          title: new _GridTitleText(_podcst.title),
          subtitle: new _GridTitleText(_podcst.author),
        ),
    );
  }
}
