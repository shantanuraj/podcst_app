import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:podcst_app/data/api.dart';
import 'package:podcst_app/data/feed.dart';
import 'package:podcst_app/data/podcst.dart';
import 'package:podcst_app/widgets/feed.dart';

const double _kMinFlingVelocity = 800.0;

const Color _kKeyUmbraOpacity = const Color(0x33000000); // alpha = 0.2
const Color _kKeyPenumbraOpacity = const Color(0x24000000); // alpha = 0.14
const Color _kAmbientShadowOpacity = const Color(0x1F000000); // alpha = 0.12

class FeedInfo extends StatefulWidget {
  FeedInfo({Key key, this.podcst}) : super(key: key);

  final Podcst podcst;

  @override
  _FeedInfoState createState() => new _FeedInfoState(podcst);
}

class _FeedInfoState extends State<FeedInfo>
    with SingleTickerProviderStateMixin {
  final Podcst _podcst;

  bool _isLoading;
  Feed _feed;
  AnimationController _controller;
  Animation<Offset> _flingAnimation;
  Offset _offset = Offset.zero;
  double _scale = 1.0;
  Offset _normalizedOffset;
  double _previousScale;
  bool _cancelRequest = false;

  _FeedInfoState(this._podcst);

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _controller = new AnimationController(vsync: this)
      ..addListener(_handleFlingAnimation);
    PodcstApi.getFeed(_podcst.feed).then(onFeedLoaded);
  }

  @override
  void dispose() {
    super.dispose();
    _cancelRequest = true;
  }

  // The maximum offset value is 0,0. If the size of this renderer's box is w,h
  // then the minimum offset value is w - _scale * w, h - _scale * h.
  Offset _clampOffset(Offset offset) {
    final Size size = context.size;
    final Offset minOffset =
        new Offset(size.width, size.height) * (1.0 - _scale);
    return new Offset(offset.dx.clamp(minOffset.dx, 0.0).toDouble(),
        offset.dy.clamp(minOffset.dy, 0.0).toDouble());
  }

  void _handleFlingAnimation() {
    setState(() {
      _offset = _flingAnimation.value;
    });
  }

  void _handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale;
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, 4.0).toDouble();
      // Ensure that image location under the focal point stays in the same place despite scaling.
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
    });
  }

  void _handleOnScaleEnd(ScaleEndDetails details) {
    final double magnitude = details.velocity.pixelsPerSecond.distance;
    if (magnitude < _kMinFlingVelocity) {
      return;
    }
    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    final double distance = (Offset.zero & context.size).shortestSide;
    _flingAnimation = new Tween<Offset>(
            begin: _offset, end: _clampOffset(_offset + direction * distance))
        .animate(_controller);
  }

  void onFeedLoaded(Feed feed) {
    if (_cancelRequest) {
      return;
    }
    setState(() {
      _isLoading = false;
      _feed = feed;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return new GestureDetector(
        onScaleStart: _handleOnScaleStart,
        onScaleUpdate: _handleOnScaleUpdate,
        onScaleEnd: _handleOnScaleEnd,
        child: new ClipRect(
          child: new Transform(
            transform: new Matrix4.identity()
              ..translate(_offset.dx, _offset.dy)
              ..scale(_scale),
            child: new Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new LinearProgressIndicator(value: null),
                  new Expanded(
                    child: new Image.network(_podcst.cover, fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return new Container(
      child: new FeedWidget(_feed),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(_podcst.cover),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
