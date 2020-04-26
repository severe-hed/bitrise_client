import 'package:bitriseclient/network/model/base_paginated.dart';
import 'package:bitriseclient/ui/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:bitriseclient/network/model/builds.dart';
import 'package:bitriseclient/network/bitrise_api.dart';
import 'package:bitriseclient/utils/duration_additions.dart';

class BuildsScreen extends BaseDataLoadingScreen<Build> {
  BuildsScreen({Key key}): super(key: key);

  @override
  String get title => "Builds";

  @override
  _BuildsScreenState createState() {
    return _BuildsScreenState();
  }
}

class _BuildsScreenState extends BaseDataLoadingScreenState<Build> {

  @override
  Future<Paginated<Build>> getData() {
    return BitriseApi.shared.getBuilds();
  }

  @override
  Widget itemWidget(BuildContext ctx, Build item) {
    return _decoratedItemWidget(ctx, item);
  }

  Widget _decoratedItemWidget(BuildContext ctx, Build build) {
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
          child: _itemWidget(ctx, build)
      );
  }

  Widget _itemWidget(BuildContext ctx, Build build) {
    const double height = 100;
    const buildColors = [Color(0xFF683d87), Colors.green, Colors.red, Colors.yellow];
    var color = buildColors[build.status];
    const buildIcons = [
      Icons.check_circle_outline,
      Icons.error_outline,
      Icons.highlight_off
    ];
    Widget icon;
    if (build.status == 0) {
      icon = Container(
        padding: EdgeInsets.all(15),
        child: CircularProgressIndicator(strokeWidth: 1,),
      );

    }
    else {
      icon = Icon(buildIcons[build.status - 1], color: color);
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
                              width: 50,
                              height: 50,
                              child: icon,
                            ),
                            build.repository.avatarUrl != null ?
                            Image.network(
                                build.repository.avatarUrl, width: 50,
                                height: 50) : Container()

                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(build.repository.owner.name, textAlign: TextAlign.left, maxLines: 2, overflow: TextOverflow.ellipsis,),
                              Text(build.repository.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 2,
                    runSpacing: 2,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6),
                        color: color.withOpacity(0.16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.merge_type),
                            Flexible(
                              child:
                              Text(
                                build.branch,
                                style: TextStyle(fontWeight: FontWeight.w600),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(6),
                          color: Colors.grey.withOpacity(0.16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 4, right: 4),
                                  child: Icon(Icons.list,)
                              ),
                              Flexible(
                                child: Text(
                                  build.triggeredWorkflow,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          )
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        color: Colors.grey.withOpacity(0.16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 4, right: 4),
                              child: Icon(Icons.query_builder),
                            ),

                            Flexible(
                                child:
                                Text(
                                  build.startedOnWorkerAt.difference(build.finishedAt ?? DateTime.now()).toReadable(),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],)
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                constraints: BoxConstraints(maxWidth: 70),
                child: Wrap(
                  runAlignment: WrapAlignment.end,
                  runSpacing: 4,
                  alignment: WrapAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
//                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        Flexible(
                            child:
                            Text(
                              build.buildNumber.toString(),
                              style: TextStyle(fontWeight: FontWeight.w600),
                              overflow: TextOverflow.clip,
                            )
                        ),
                        Icon(Icons.build, size: 16,),
                      ],
                    ),
                  ],
                ),
              )
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