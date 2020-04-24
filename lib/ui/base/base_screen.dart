import 'package:flutter/material.dart';
import 'package:bitriseclient/network/model/base_paginated.dart';


class BaseDataLoadingScreen<T> extends StatefulWidget {
  BaseDataLoadingScreen({Key key}): super(key: key);

  final String title = "not implemented";
  Future<Paginated<T>> _future = null;

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class BaseDataLoadingScreenState<T> extends State<BaseDataLoadingScreen<T>> {

  Future<Paginated<T>> getData() {
    throw Exception("should override");
  }

  Future _reload() {
    setState(() {
      widget._future = getData();
    });
    return widget._future;
  }

  Widget itemWidget(BuildContext ctx, T item) {
    throw Exception("should override");
  }

  @override
  void initState() {
    super.initState();
    if (widget._future == null) {
      widget._future = getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        RefreshIndicator(
            onRefresh: () async { return await _reload(); },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
//              backgroundColor: Color(0xFFEEEEEE),
//                title: Text("widget.title"),
                    floating: true,
                    pinned: true,
                    stretch: true,
                    expandedHeight: 82,
                    actions: <Widget>[
                      RaisedButton(
                        child: Icon(Icons.refresh),
                        onPressed: _reload,
                      )
                    ],
                    flexibleSpace:
                    FlexibleSpaceBar(
                      stretchModes: [
                        StretchMode.zoomBackground,
                      ],
                      centerTitle: false,
                      titlePadding: EdgeInsets.all(16),
                      title:
                      Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                    )
                ),
                RefreshIndicator(
                    onRefresh: () {
                      return _reload();
                    },

                    child:
                    FutureBuilder(
                        future: widget._future,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                        (context, index) => _loadingWidget(context),
                                    childCount: 1
                                ),
                              );
                              break;
                            case ConnectionState.done: {
                              if (snapshot.hasData) {
                                Paginated<T> elements = snapshot.data;
                                return
                                  SliverList(
                                    delegate:
                                    SliverChildBuilderDelegate(
                                            (context, index) {
                                          var element = elements.data[index];
                                          return itemWidget(context, element);
                                        },
                                        childCount: elements.data.length
                                    ),
                                  );
                              }
                              else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                            }
                            break;
                            default:
                              break;
                          }
                          return Container();
                        }
                    )
                )
              ],
            )
        )
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return
      Container(
        height: 100,
        decoration: BoxDecoration(
//            color: Colors.black
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
  }
}