import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'package:podcst_app/data/podcst.dart';
import 'package:podcst_app/data/podcst_response.dart';

class PodcstApi {

  static final String _baseUrl = 'https://data.podcst.io';

  static final String _top = '/top';

  static String _getUrl(String endpoint) => _baseUrl + endpoint;

  static final _http = createHttpClient();

  static Future<List<Podcst>> _getPodcsts(String url) async {
    var res = await _http.get(url);

    List<Map> raw = JSON.decode(res.body);
    PodcstResponse response = PodcstResponse.parse(raw);

    return response.data;
  }

  static Future<List<Podcst>> getFeatured() => _getPodcsts(_getUrl(_top));
}