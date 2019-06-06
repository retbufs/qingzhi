import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticlePage extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(_) =>WebviewScaffold(url: "https://www.zhenio.com"),
      },
    );
  }
}
