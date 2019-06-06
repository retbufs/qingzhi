import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuWidgetState();
  }
}

class _MenuWidgetState extends State<MenuWidget> {
  final List<String> _menuName = <String>[
    '我的钱包',
    '我的服务',
    '我的订单',
    '我的收藏',
    '任务中心',
    '评团历史',
    '招聘中心',
    '推广中心',
    '设置中心'
  ];
  final List<IconData> _IconData = <IconData>[
    Icons.featured_play_list,
    Icons.assessment,
    Icons.account_balance,
    Icons.map,
    Icons.confirmation_number,
    Icons.send,
    Icons.confirmation_number,
    Icons.send,
    Icons.settings
  ];

  var _current_menu;

  //构建菜单
  Widget _buildMenu(String name, IconData icon, Color color, int position) {
    return Material(
      child: GestureDetector(
          onTap: () {
            setState(() {
              _current_menu = position;
              //这里处理页面
            });
          },
          child: Container(
            height: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                      child: Icon(
                        icon,
                        color: color,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 1,
                  color: Colors.black12,
                )
//                Container(
//                  margin: EdgeInsets.only(left: 10, right: 10),
//                  padding: const EdgeInsets.only(top: 5),
//                  color: Colors.black12,
//                  height: 1,
//                )
              ],
            ),
          )),
    );
  }

  List<Widget> _generate() {
    final List<Widget> _listWidget = <Widget>[];
    for (int i = 0; i < _menuName.length; i++) {
      _listWidget
          .add(_buildMenu(_menuName[i], _IconData[i], Colors.blue[500], i));
    }
    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _generate(),
      ),
    );
  }
}
