import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart';
import 'package:podcst_app/data/podcst.dart';
import 'package:podcst_app/data/podcst_response.dart';

class PodcstApi {

  static final String _baseUrl = 'https://api.podcst.io';

  static final String _popular  = '/popular';
  static final String _trending = '/trending';
  static final String _featured = '/featured';

  static final _http = createHttpClient();

  static String _getUrl(String endpoint) {
    return _baseUrl + endpoint;
  }

  static Future<List<Podcst>> _getPodcsts(String url) async {
    var res = await _http.get(url);

    Map raw = JSON.decode(res.body);
    PodcstResponse response = PodcstResponse.Parse(raw);

    return response.data;
  }

  static Future<List<Podcst>> getPopular() async {
    String url = _getUrl(_popular);
    return _getPodcsts(url);
  }

  static Future<List<Podcst>> getFeatured() async {
    String url = _getUrl(_featured);
    return _getPodcsts(url);
  }

  static Future<List<Podcst>> getTrending() async {
    String url = _getUrl(_trending);
    return _getPodcsts(url);
  }
}