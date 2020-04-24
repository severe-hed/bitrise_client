
import 'package:bitriseclient/network/model/apps.dart';
import 'package:bitriseclient/network/model/base_paginated.dart';
import 'package:bitriseclient/network/model/builds.dart';
import 'package:http/http.dart' as http;

class BitriseApi {
  static final shared = BitriseApi();

  static const String _apiKey = "JDW_wEdUixA2OcfBKaYpohnFw2zrqXn3Liz8XBfiqFvl89oFlQQwPl9bukfww1qdwUH1SEvXKv1yIlUBJsGRbg";
  final String _baseUrl = "https://api.bitrise.io/";
  static const Map<String, String> _authHeaders = {"Authorization": _apiKey};

  Future<Builds> getBuilds() async {
    var url = _baseUrl + "v0.1/builds";
    var response = await http.get(url, headers: _authHeaders);
    return Builds.fromRawJson(response.body);
  }

  Future<Paginated<AppModel>> getApps() async {
    var url = _baseUrl + "v0.1/me/apps";
    var response = await http.get(url, headers: _authHeaders);
    return Apps.fromRawJson(response.body);
  }
}