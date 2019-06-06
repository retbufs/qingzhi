import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecommendState();
  }
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        //2行
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 67,
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  print("头像");
                },
                child: ClipOval(
                  child: Image.network(
                    "http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg",
                    height: 38,
                    width: 38,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                 padding: EdgeInsets.only(top: 6),
                  height: 28,
                  child: Text(
                    '陈平',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    '没有简介',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.purple
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            color: Colors.lightBlueAccent,height: 1),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

            ],
          ),
        )
      ],
    ));
  }
}
