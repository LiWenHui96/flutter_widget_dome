import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/02/01 9:49 AM
/// @Describe:

class RouterUtil {
  static Future<T> pushWidget<T>(
    BuildContext context,
    Widget widget, {
    bool replaceRoot = false,
    bool replaceCurrent = false,
  }) {
    return pushRoute(
      context,
      CupertinoPageRoute(builder: (ctx) => widget),
      replaceRoot: replaceRoot,
      replaceCurrent: replaceCurrent,
    );
  }

  static Future<T> pushRoute<T>(
    BuildContext context,
    PageRoute<T> route, {
    bool replaceRoot = false,
    bool replaceCurrent = false,
  }) {
    assert(!(replaceRoot == true && replaceCurrent == true));
    if (replaceRoot == true) {
      return Navigator.pushAndRemoveUntil(
        context,
        route,
        _rootRoute,
      );
    }
    if (replaceCurrent == true) {
      return Navigator.pushReplacement(context, route);
    }
    return Navigator.push(context, route);
  }
}

var _rootRoute = ModalRoute.withName('home');
