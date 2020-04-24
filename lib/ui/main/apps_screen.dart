import 'package:flutter/material.dart';
import 'package:bitriseclient/network/bitrise_api.dart';
import 'package:bitriseclient/network/model/apps.dart';
import 'package:bitriseclient/ui/base/base_screen.dart';


class AppsScreen extends BaseDataLoadingScreen<AppModel> {
  AppsScreen({Key key}): super(key: key);

  @override
  String get title => "Apps";

  createState() => _AppsScreenState();
}

class _AppsScreenState extends BaseDataLoadingScreenState<AppModel> {

  @override
  getData() => BitriseApi.shared.getApps();

  @override
  Widget itemWidget(BuildContext ctx, AppModel item) {
    return
        Text(item.title);
  }
}