import 'package:flutter/material.dart';
import 'package:qingzhi_em/dev_config.dart';
import 'package:qingzhi_em/dynamic/dynamic_page.dart';
import 'package:qingzhi_em/message/message_page.dart';
import 'package:qingzhi_em/mine/mine_page.dart';
import 'package:qingzhi_em/plaza/plaza_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0; //当前所在的页面 默认首页
  List<BottomNavigationBarItem> _navigationitems;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      items: _navigationitems,
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _currentPage = _pageList[_currentIndex];
        });
      },
    );
    return Scaffold(
      body: new Center(
        child: _currentPage,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    for(BottomNavigationBarItem view in _navigationitems){
//
//    }
  }

  @override
  void initState() {
    super.initState();
    _pageList = <StatefulWidget>[
      DynamicPage(),
      MessagePage(),
      PlazaPage(),
      MinePage(),
    ];

    _navigationitems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.assessment),
          title: Text('首页'),
          backgroundColor: Colors.blue),
      BottomNavigationBarItem(
        icon: Icon(Icons.assessment),
        title: Text('消息'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.all_inclusive),
        title: Text('广场'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assessment),
        title: Text('我的'),
      )
    ];
    _currentPage = _pageList[_currentIndex];
  }
}
