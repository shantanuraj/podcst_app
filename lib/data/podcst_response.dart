import 'package:podcst_app/data/podcst.dart';

class PodcstResponse {
  final int statusCode;
  final String message;
  final List<Podcst> data;

  const PodcstResponse({ this.statusCode, this.message, this.data });

  static PodcstResponse parse(Map raw) {
    return new PodcstResponse(
      statusCode: raw['statusCode'],
      message: raw['message'],
      data: (raw['data'] as List<Map>).map(Podcst.parse).toList()
    );
  }
}