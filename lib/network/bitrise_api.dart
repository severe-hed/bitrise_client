
import 'package:bitriseclient/network/model/apps.dart';
import 'package:bitriseclient/network/model/base_paginated.dart';
import 'package:bitriseclient/network/model/builds.dart';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class BitriseApi {
  static final shared = BitriseApi();

  final String _baseUrl = "https://api.bitrise.io/";
  static const Map<String, String> _authHeaders = {"Authorization": API_KEY};

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