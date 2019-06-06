import 'package:flutter/material.dart';
import 'package:qingzhi_em/dev_config.dart';
import 'package:qingzhi_em/dynamic/boxes.dart';
import 'package:qingzhi_em/dynamic/recommend.dart';

import 'package:qingzhi_em/dynamic/mate_page.dart';
import 'package:qingzhi_em/search.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage>
    with TickerProviderStateMixin {
  var _title = "动态";

  //TabController _tabController;

  Widget search_ed() {
    return Container(
      decoration: BoxDecoration(color: Colors.black12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton.icon(
                disabledColor: Colors.white,
                onPressed: () {
                  //跳转到搜索页
                  //组件页面切换
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: Icon(
                  Icons.search,
                  color: GlobalConfig.fontColor,
                ),
                label: new Text("搜索感兴趣的内容")),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // _tabController = TabController(length: 3, vsync: this);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: search_ed(),
          bottom: TabBar(tabs: [
            Tab(text: "推荐"),
            Tab(text: "匣子"),
            Tab(text: "匹配匣友"),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Recommend(),
            Boxes(),
            MateFriend(),
          ],
          //  controller: _tabController,
        ),
      ),
    );
  }
}
