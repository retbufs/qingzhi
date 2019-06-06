import 'package:flutter/material.dart';

//聊天页面
class ChatPage extends StatefulWidget {
  final String _name;

  const ChatPage(this._name, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatPageState(this._name);
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final String _name;
  final TextEditingController _editingController = new TextEditingController();
//  TextEditingController
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;
  _ChatPageState(this._name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
//            child: ChatMessage(text: '消息'),
            child: ListView.builder(
              padding: new EdgeInsets.all(8.0),
              scrollDirection: Axis.vertical,
              // padding: new EdgeInsets.all(8.0),
              itemBuilder: (_, int index) => _messages[index],
              reverse: true,
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
              child: TextField(
            controller: _editingController,
            onChanged: (String text) {
              setState(() {
                _isComposing = text.length > 0;
              });
            },
            onSubmitted: _handleSubmitted,
            decoration: InputDecoration(hintText: '请输入聊天内容'),
          )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  //这里需要传入需要发送的内容
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_editingController.text)
                      : null))
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _editingController.clear();
    setState(() {
      _isComposing = false;
    });

    ChatMessage chatMessage = new ChatMessage(this._name, text,
        animationController:
        AnimationController(vsync: this,
            duration: Duration(milliseconds: 700)));
    setState(() {
      if (text == null) {
        return;
      }
      _messages.insert(0, chatMessage);
    });
    chatMessage.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage chatMessage in _messages)
      chatMessage.animationController.dispose();
    super.dispose();
  }
}

//const String _name = "小叶";

//聊天消息部件
class ChatMessage extends StatelessWidget {
  ChatMessage(this._name, this._text, {this.animationController});

  final String _name;
  final String _text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut),
        axisAlignment: 0.0,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: Text(_name[0])),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_name, style: Theme.of(context).textTheme.subhead),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(_text),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
