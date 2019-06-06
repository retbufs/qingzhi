import 'package:flutter/material.dart';

class Routes {
  var map = {};

  dynamic sendPage(@required BuildContext context, @required String page) {
    addRoute("/add", (context)=> Navigator.pop(context));
  }

  void addRoute(String add, Function func) {
    map[add] = func;
  }
}