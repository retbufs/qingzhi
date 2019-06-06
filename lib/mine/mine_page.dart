import 'package:flutter/material.dart';

import 'menu_widget.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

final Image _men = Image.asset("assets/icon_men.png",
    semanticLabel: 'men', height: 14, width: 14, fit: BoxFit.fitWidth);
final Image _women = Image.asset(
  "assets/icon_women.png",
  semanticLabel: 'women',
  height: 14,
  width: 14,
);

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
          appBar: AppBar(
            title: Text('我的主页'),
            centerTitle: true,
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: 70,
                child:ListTile(
                  leading: GestureDetector(
                    onTap: (){
                      print("修改头像");
                    },
                    child: ClipOval(
                      child: Image.network(
                        "http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg",
                        height: 48,
                        width: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text("陈平"),
                  subtitle: Text('没有说明'),
                  trailing:FlatButton.icon(onPressed: (){print("修改资料");},
                      icon: Icon(Icons.mode_edit), label:Text("修改") ),

                ),
              ),
//          HeadWidget(),
              Container(
                color: Colors.black12,
                height: 8,
              ),
              MenuWidget()
            ],
          ),
        ));
  }
}

//头部内容
class HeadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.only(top: 15),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  print('头像切换');
                },
                child: ClipOval(
                  child: Image.network(
                    "http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg",
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 26),
                  height: 24,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "UserName",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 5),
                        child: Image.asset(
                          "assets/icon_men.png",
                          width: 10,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("修改资料");
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.mode_edit,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 24,
                  child: Text(
                    '节目主持人',
                    style: TextStyle(color: Colors.black38, fontSize: 14),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//底部列表内容
class ListMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MenuWidget();
  }
}
