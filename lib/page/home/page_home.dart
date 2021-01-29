import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/base_state.dart';

/// @Author: LWH
/// @Host: liwenhui
/// @Date: 2021/01/29 3:16 PM
/// @Describe: 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("首页"),
      ),
    );
  }
}