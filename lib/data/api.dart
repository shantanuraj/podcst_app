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

  static String _getUrl(String endpoint) => _baseUrl + endpoint;

  static final _http = createHttpClient();

  static Future<List<Podcst>> _getPodcsts(String url) async {
    var res = await _http.get(url);

    Map raw = JSON.decode(res.body);
    PodcstResponse response = PodcstResponse.Parse(raw);

    return response.data;
  }

  static Future<List<Podcst>> getPopular() => _getPodcsts(_getUrl(_popular));

  static Future<List<Podcst>> getFeatured() => _getPodcsts(_getUrl(_featured));

  static Future<List<Podcst>> getTrending() => _getPodcsts(_getUrl(_trending));
}