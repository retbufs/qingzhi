import 'package:flutter/material.dart';
import 'package:qingzhi_em/dynamic/dynamic_page.dart';
import 'package:qingzhi_em/search.dart';
class Routes {
  //配置路由
  final routes = {
    "/index": (context, {argument}) => DynamicPage(),
  };

  onGenerateRoute(RouteSettings setting) {
    final String name = setting.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (setting.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, argument: setting.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
  }
}
