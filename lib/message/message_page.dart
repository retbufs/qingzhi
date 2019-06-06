import 'package:flutter/material.dart';
import 'package:qingzhi_em/form_page.dart';
import 'package:qingzhi_em/message/chat_page.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  static void sendChatPage(BuildContext context, {String name, String userId}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ChatPage(name)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('消息'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _SystemNotice(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ChatList(
                    imgUrl:
                        "http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg",
                    title: "张三",
                    subTitle: "你爸爸喊你回家吃饭了",
                    tColor: Colors.blue,
                    allow: true,
                    onTap: () {
                      sendChatPage(context, name: "张三");
                    },
                  ),
                  ChatList(
                    imgUrl:
                        "http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg",
                    title: "李四",
                    subTitle: "你爸爸喊你回家吃饭了",
                    tColor: Colors.blue,
                    onTap: () {
                      sendChatPage(context, name: "李四");
                    },
                  ),
                  ChatList(
                    imgUrl:
                        "http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg",
                    title: "王五",
                    subTitle: "你爸爸喊你回家吃饭了",
                    tColor: Colors.blue,
                    onTap: () {
                      sendChatPage(context, name: "王五");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    //系统页面
    List<Widget> chat_meg() {}
  }
}

//用户列表项
class ChatList extends StatelessWidget {
  //添加点击事件动画
  final Widget imgPic;
  final String imgUrl;
  final String title;
  final String subTitle;
  final String rtTime;
  final String rlIcon;
  final bool allow;
  final Color tColor;
  final GestureTapCallback onTap;

  const ChatList(
      {Key key,
      this.onTap,
      this.imgPic,
      this.imgUrl,
      this.title,
      this.subTitle,
      this.rtTime,
      this.allow = false,
      this.rlIcon,
      this.tColor})
      : assert(title != null),
        assert(subTitle != null),
        super(key: key);

  Widget widgetPic() {
    if (imgPic == null) {
      assert(imgUrl != null);
      assert(imgPic == null);
      return Image.network(
        imgUrl,
        fit: BoxFit.cover,
      );
    } else {
      return imgPic;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 49,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(4),
                  height: 45,
                  width: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: widgetPic(),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 4, left: 4),
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: tColor == null ? Colors.black : tColor,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 4, 3, 0),
                          width: 44,
                          child: Text(
                            "上午 11:39",
                            style: TextStyle(fontSize: 8),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 5, top: 5),
                            child: Text(
                              subTitle,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 8, color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _SystemNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                _MessagePageState.sendChatPage(context, name: "王五");
              },
              child: ChatList(
                imgPic: CircleAvatar(
                  child: Text('青'),
                  backgroundColor: Colors.blue,
                ),
                title: "系统消息",
                subTitle: "这是系统消息",
                tColor: Colors.blue,
                allow: true,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _MessagePageState.sendChatPage(context, name: "王五");
              },
              child: ChatList(
                imgPic: CircleAvatar(
                  child: Text('执'),
                  backgroundColor: Colors.blue,
                ),
                title: "系统公告",
                subTitle: "这是系统消息",
                tColor: Colors.blue,
                allow: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
