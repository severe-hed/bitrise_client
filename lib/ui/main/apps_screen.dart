import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitriseclient/network/bitrise_api.dart';
import 'package:bitriseclient/network/model/apps.dart';
import 'package:bitriseclient/ui/base/base_screen.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

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
        _decoratedItemWidget(ctx, item);
  }

  Widget _decoratedItemWidget(BuildContext ctx, AppModel item) {
    return
      Container(
//        padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 1,

                    offset: Offset(0, 0)
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: _itemWidget(ctx, item)
      );
  }

  Widget _itemWidget(BuildContext ctx, AppModel item) {
    const double height = 100;
    const buildColors = [Colors.green, Colors.yellow, Colors.red];
    var color = buildColors[item.status - 1];
    const buildIcons = [
      Icon(Icons.check_circle_outline, color: Colors.green,),
      Icon(Icons.error_outline, color: Colors.yellow,),
      Icon(Icons.highlight_off, color: Colors.red,)
    ];
    var icon = buildIcons[item.status - 1];
    var platformIcon = SFSymbols.app;
    if (item.projectType == 'ios') {
      platformIcon = SFSymbols.logo_apple;
    }
    else if (item.projectType == 'android') {
      platformIcon = SFSymbols.logo_android;
    }

    return
      Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(ctx).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 4, right: 55),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      runSpacing: 0,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                              height: 50,
                              child: icon,
                            ),
                            Image.network(item.avatarUrl, width: 50, height: 50,),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item.owner.name + "asdasdasdssdsds", textAlign: TextAlign.left, maxLines: 2, overflow: TextOverflow.ellipsis,),
                              Text(item.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],)
          ),
          Positioned(
              right: 0, top: 0, width: 40, height: 50,
              child: Icon(platformIcon)
          ),

          Positioned(
              width: 10,
              top: 0,
              left: 0,
              bottom: 0,
              child:
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                child: Container(
                  color: color,
                ),
              )
          ),
          Positioned.fill(
              child: Material(
                  color: Colors.transparent,
                  child:
                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    onTap: () {},
                  )
              )
          )
        ],
      );
  }
}