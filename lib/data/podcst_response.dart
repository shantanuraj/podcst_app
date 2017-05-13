import 'package:podcst_app/data/podcst.dart';

class PodcstResponse {
  final List<Podcst> data;

  const PodcstResponse({ this.data });

  static PodcstResponse parse(List<Map> raw) {
    return new PodcstResponse(
      data: raw.map(Podcst.parse).toList()
    );
  }
}